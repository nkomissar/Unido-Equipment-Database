package org.unido.eetdb.daemon.db;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.sql.Types;
import java.util.List;

import javax.sql.DataSource;

import org.apache.log4j.Logger;
import org.unido.eetdb.common.model.Entity;
import org.unido.eetdb.common.model.EntityProperty;

public class DbWriter
{
    private static final Logger logger   = Logger.getLogger(DbWriter.class);

    private static final String INSERT_ENTITY_SQL = "INSERT INTO" +
    		"unido_entity(" +
    		    "entity_id, " +
    		    "entity_template_id, " +
    		    "entity_name, " +
    		    "version, " +
    		    "status, " +
    		    "updated_by, " +
    		    "update_date) " +
            "VALUES(?, ?, ?, ?, ?, ?, ?)";

    private static final String INSERT_ENTITY_PROPERTY_SQL = "INSERT INTO" +
            "unido_entity_property(" +
                "entity_id, " +
                "template_property_id, " +
                "value_type_id, " +
                "value, " +
                "version, " +
                "updated_by, " +
                "update_date) " +
            "VALUES(?, ?, ?, ?, ?, ?)";
    
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
                long entityPropertyId;

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
                    entityStatement.setString(2, entity.getName());
                    entityStatement.setInt(3, 0);
                    entityStatement.setString(4, "PENDING");
                    entityStatement.setString(5, "SYSTEM");
                    entityStatement.setTimestamp(6, new Timestamp(System.currentTimeMillis()));

                    entityStatement.addBatch();

                    for (EntityProperty entityProperty : entity.getProperties())
                    {
                        idGenerator.executeQuery();

                        entityPropertyId = idGenerator.getLong(1);

                        entityPropertyStatement.setLong(1, entityPropertyId);
                        entityPropertyStatement.setString(2, entity.getName());
                        entityPropertyStatement.setInt(3, 0);
                        entityPropertyStatement.setString(4, "PENDING");
                        entityPropertyStatement.setString(5, "SYSTEM");
                        entityPropertyStatement.setTimestamp(6, new Timestamp(System.currentTimeMillis()));

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

    public DataSource getDataSource()
    {
        return dataSource;
    }

    public void setDataSource(DataSource dataSource)
    {
        this.dataSource = dataSource;
    }
}
