package org.unido.eetdb.daemon.db;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.log4j.Logger;
import org.unido.eetdb.common.model.Entity;
import org.unido.eetdb.common.model.EntityProperty;
import org.unido.eetdb.common.model.EntityTemplate;
import org.unido.eetdb.common.model.EntityTemplateProperty;

public class DbHelper
{
    private static final Logger logger   = Logger.getLogger(DbHelper.class);

    private final static Map<String, EntityTemplate> templates = new HashMap<String, EntityTemplate>();

    private static final String GET_PROPERTIES_SQL =
            "select " +
                "template.ENTITY_TEMPLATE_ID as template_id, " +
                "TEMPLATE_PROPERTY_ID as template_property_id, " +
                "PROPERTY_CODE as template_property_code " +
            "from " +
                "UNIDO_ENTITY_TEMPLATE_PROPERTY properties " +
            "join " +
                "UNIDO_ENTITY_TEMPLATE template " + 
             "on properties.ENTITY_TEMPLATE_ID=template.ENTITY_TEMPLATE_ID " + 
             "where " +
                 "template.TEMPLATE_CODE=?";

    private static final String INSERT_ENTITY_SQL = "INSERT INTO " +
    		"unido_entity(" +
    		    "entity_id, " +
    		    "entity_template_id, " +
    		    "entity_name, " +
    		    "version, " +
    		    "status, " +
    		    "updated_by) " +
            "VALUES(?, ?, ?, ?, ?, ?)";

    private static final String INSERT_ENTITY_PROPERTY_SQL = "INSERT INTO " +
            "unido_entity_property(" +
                "entity_id, " +
                "template_property_id, " +
                "value, " +
                "version, " +
                "updated_by) " +
            "VALUES(?, ?, ?, ?, ?)";

    private static final String GET_ID = "{? = call SEQ_NEXTVAL}";

    private DataSource          dataSource;

    public boolean persistEntities(List<Entity> entities)
    {
        logger.debug(String.format("Saving %d entities.", entities.size()));

        Connection connection = null;
        PreparedStatement entityStatement = null;
        PreparedStatement entityPropertyStatement = null;
        CallableStatement idGenerator = null;

        try
        {
            if (!entities.isEmpty())
            {
                long entityId;

                connection = dataSource.getConnection();

                connection.setTransactionIsolation(Connection.TRANSACTION_READ_COMMITTED);
                connection.setAutoCommit(false);

                entityStatement = connection.prepareCall(INSERT_ENTITY_SQL);
                entityPropertyStatement = connection.prepareCall(INSERT_ENTITY_PROPERTY_SQL);
                idGenerator = connection.prepareCall(GET_ID);

                idGenerator.registerOutParameter(1, Types.INTEGER);

                for (Entity entity : entities)
                {
                    idGenerator.executeQuery();

                    entityId = idGenerator.getLong(1);

                    entityStatement.setLong(1, entityId);
                    entityStatement.setLong(2, entity.getEntityTemplate().getId());
                    entityStatement.setString(3, entity.getName());
                    entityStatement.setInt(4, 0);
                    entityStatement.setString(5, "PENDING");
                    entityStatement.setString(6, "SYSTEM");

                    entityStatement.addBatch();

                    for (EntityProperty entityProperty : entity.getProperties())
                    {
                        entityPropertyStatement.setLong(1, entityId);
                        entityPropertyStatement.setLong(2, entityProperty.getTemplateProperty().getId());
                        entityPropertyStatement.setString(3, entityProperty.getValue());
                        entityPropertyStatement.setInt(4, 0);
                        entityPropertyStatement.setString(5, "SYSTEM");

                        entityPropertyStatement.addBatch();
                    }
                }

                entityStatement.executeBatch();
                entityPropertyStatement.executeBatch();
                
                connection.commit();

                logger.debug("Data points saved successfully.");
            }

            return true;
        }
        catch (Throwable t)
        {
            logger.error("Failed to save data points.", t);
            
            try
            {
                connection.rollback();
            }
            catch (SQLException e)
            {
                logger.error("Failed to rollback transaction.", e);
            }

            return false;
        }
        finally
        {
            closeStatement(entityStatement);
            closeStatement(entityPropertyStatement);
            closeStatement(idGenerator);

            closeConnection(connection);
        }
    }
    
    public EntityTemplate getEntityTemplate(String templateCode)
    {
        EntityTemplate retVal = null;
        
        if(templates.containsKey(templateCode))
        {
            retVal = templates.get(templateCode);
        }
        else
        {
            retVal = loadEntityTemplate(templateCode);

            if(retVal != null)
            {
                synchronized(templates)
                {
                    if(!templates.containsKey(templateCode))
                    {
                        templates.put(retVal.getCode(), retVal);
                    }
                }
            }
        }
        
        return retVal;
    }
    
    private EntityTemplate loadEntityTemplate(String templateCode)
    {
        logger.info(String.format("Loading entity template: %s", templateCode));

        Connection connection = null;
        PreparedStatement statement = null;
        EntityTemplate template = null;

        try
        {
            connection = dataSource.getConnection();
            statement = connection.prepareStatement(GET_PROPERTIES_SQL);
            
            statement.setString(1, templateCode);

            ResultSet resultSet = statement.executeQuery();
            
            if(resultSet.first())
            {
                template = new EntityTemplate();

                template.setCode(templateCode);
                template.setId(resultSet.getLong("template_id"));

                do
                {
                    EntityTemplateProperty property = new EntityTemplateProperty();
                    
                    property.setId(resultSet.getLong("template_property_id"));
                    property.setCode(resultSet.getString("template_property_code"));

                    template.getProperties().add(property);
                }
                while(resultSet.next());
            }
        }
        catch (Throwable t)
        {
            logger.error("Failed to get list of databuses.", t);

            return null;
        }
        finally
        {
            closeStatement(statement);
            closeConnection(connection);
        }

        return template;
    }
    
    private void closeStatement(Statement statement)
    {
        if (statement != null)
        {
            try
            {
                statement.close();
            }
            catch (SQLException e)
            {
                logger.error("Failed to close statement.", e);
            }
        }
    }
    
    private void closeConnection(Connection connection)
    {
        if (connection != null)
        {
            try
            {
                connection.close();
            }
            catch (SQLException e)
            {
                logger.error("Failed to close connection.", e);
            }
        }
    }
    
    public DataSource getDataSource()
    {
        return dataSource;
    }

    public void setDataSource(DataSource dataSource)
    {
        this.dataSource = dataSource;
    }
}