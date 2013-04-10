package org.unido.eetdb.daemon.db;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.log4j.Logger;
import org.unido.eetdb.common.model.Entity;
import org.unido.eetdb.common.model.EntityProperty;
import org.unido.eetdb.common.model.EntityTemplate;
import org.unido.eetdb.common.model.EntityTemplateProperty;
import org.unido.eetdb.common.model.Topic;
import org.unido.eetdb.common.model.ValueType;

enum ObjectType
{
    EntityTemplate, Catalog, Topic
}

public class DbHelper
{
    private static final Logger              logger                     = Logger.getLogger(DbHelper.class);

    private final static Map<String, Object> objectCache                = new HashMap<String, Object>();

    private static final String              GET_PROPERTIES_SQL         = "select "
                                                                                + "template.ENTITY_TEMPLATE_ID as template_id, "
                                                                                + "TEMPLATE_PROPERTY_ID as template_property_id, "
                                                                                + "UPPER(PROPERTY_CODE) as template_property_code "
                                                                                + "UPPER(TYPE) as value_type "
                                                                                + "from "
                                                                                + "UNIDO_ENTITY_TEMPLATE_PROPERTY properties "
                                                                                + "join "
                                                                                + "UNIDO_ENTITY_TEMPLATE template "
                                                                                + "on properties.ENTITY_TEMPLATE_ID=template.ENTITY_TEMPLATE_ID "
                                                                                + "join "
                                                                                + "UNIDO_VALUE_TYPE value_type"
                                                                                + "on properties.VALUE_TYPE_ID=value_type.VALUE_TYPE_ID "
                                                                                + "where "
                                                                                + "UPPER(template.TEMPLATE_CODE)=?";

    private static final String              GET_CATALOG_SQL            = "select "
                                                                                + "ENTITY_ID as entity_id, "
                                                                                + "UPPER(ENTITY_NAME) as entity_name "
                                                                                + "from "
                                                                                + "UNIDO_ENTITY entity "
                                                                                + "join "
                                                                                + "UNIDO_ENTITY_TEMPLATE template "
                                                                                + "on entity.ENTITY_TEMPLATE_ID=template.ENTITY_TEMPLATE_ID "
                                                                                + "where "
                                                                                + "UPPER(template.TEMPLATE_CODE)=?";

    private static final String              GET_TOPIC_BY_CODE_SQL      = "SELECT topic_id FROM UNIDO_TOPIC WHERE UPPER(topic_name)=? ";

    private static final String              INSERT_REFERENCE_SQL       = "INSERT INTO "
                                                                                + "UNIDO_ENTITY_REFERENCE("
                                                                                + "entity_id, "
                                                                                + "topic_id) "
                                                                                + "VALUES(?, ?)";

    private static final String              DELETE_ENTITY_SQL          = "DELETE FROM "
                                                                                + "UNIDO_ENTITY "
                                                                                + "WHERE UPPER(entity_name)=? "
                                                                                + "AND status='PENDING'";

    private static final String              INSERT_ENTITY_SQL          = "INSERT INTO "
                                                                                + "UNIDO_ENTITY("
                                                                                + "entity_id, "
                                                                                + "entity_template_id, "
                                                                                + "entity_name, "
                                                                                + "version, "
                                                                                + "status, "
                                                                                + "updated_by) "
                                                                                + "VALUES(?, ?, ?, ?, ?, ?)";

    private static final String              INSERT_ENTITY_PROPERTY_SQL = "INSERT INTO "
                                                                                + "UNIDO_ENTITY_PROPERTY("
                                                                                + "entity_id, "
                                                                                + "template_property_id, "
                                                                                + "value, "
                                                                                + "version, "
                                                                                + "updated_by) "
                                                                                + "VALUES(?, ?, ?, ?, ?)";

    private static final String              GET_ID                     = "select SEQ_NEXTVAL()";

    private DataSource                       dataSource;

    public boolean persistEntities(List<Entity> entities)
    {
        logger.debug(String.format("Saving %d entities.", entities.size()));

        Connection connection = null;
        PreparedStatement entityStatement = null;
        PreparedStatement entityPropertyStatement = null;
        PreparedStatement referenceStatement = null;
        PreparedStatement deleteEntityStatement = null;
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
                referenceStatement = connection.prepareStatement(INSERT_REFERENCE_SQL);
                deleteEntityStatement = connection.prepareStatement(DELETE_ENTITY_SQL);
                idGenerator = connection.prepareCall(GET_ID);

                for (Entity entity : entities)
                {
                    deleteEntityStatement.setString(1, entity.getName().toUpperCase());
                    deleteEntityStatement.addBatch();

                    ResultSet rs = idGenerator.executeQuery();

                    rs.first();

                    entityId = rs.getLong(1);

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
                        entityPropertyStatement.setLong(2, entityProperty.getTemplateProperty()
                                .getId());
                        entityPropertyStatement.setString(3, entityProperty.getValue());
                        entityPropertyStatement.setInt(4, 0);
                        entityPropertyStatement.setString(5, "SYSTEM");

                        entityPropertyStatement.addBatch();
                    }

                    for (Topic topic : entity.getParentTopics())
                    {
                        referenceStatement.setLong(1, entityId);
                        referenceStatement.setLong(2, topic.getId());

                        referenceStatement.addBatch();
                    }
                }

                deleteEntityStatement.executeBatch();
                entityStatement.executeBatch();
                entityPropertyStatement.executeBatch();
                referenceStatement.executeBatch();

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
            closeStatement(referenceStatement);
            closeStatement(deleteEntityStatement);
            closeStatement(entityStatement);
            closeStatement(entityPropertyStatement);
            closeStatement(idGenerator);

            closeConnection(connection);
        }
    }

    private Topic loadTopic(String topicCode)
    {
        Topic topic = null;

        if (topicCode != null)
        {
            logger.info(String.format("Loading topic: %s", topicCode));

            Connection connection = null;
            PreparedStatement statement = null;

            try
            {
                connection = dataSource.getConnection();
                statement = connection.prepareStatement(GET_TOPIC_BY_CODE_SQL);

                statement.setString(1, topicCode.toUpperCase());

                ResultSet resultSet = statement.executeQuery();

                if (resultSet.first())
                {
                    topic = new Topic();

                    topic.setId(resultSet.getLong("topic_id"));
                }
            }
            catch (Throwable t)
            {
                logger.error("Failed to get topic.", t);
            }
            finally
            {
                closeStatement(statement);
                closeConnection(connection);
            }
        }
        else
        {
            logger.error("Null topic code.");
        }

        return topic;
    }

    private EntityTemplate loadEntityTemplate(String templateCode)
    {
        EntityTemplate template = null;

        if (templateCode != null)
        {
            logger.info(String.format("Loading entity template: %s", templateCode));

            Connection connection = null;
            PreparedStatement statement = null;

            try
            {
                connection = dataSource.getConnection();
                statement = connection.prepareStatement(GET_PROPERTIES_SQL);

                statement.setString(1, templateCode.toUpperCase());

                ResultSet resultSet = statement.executeQuery();

                if (resultSet.first())
                {
                    template = new EntityTemplate();

                    template.setCode(templateCode);
                    template.setId(resultSet.getLong("template_id"));

                    do
                    {
                        EntityTemplateProperty property = new EntityTemplateProperty();
                        ValueType valueType = new ValueType();

                        property.setId(resultSet.getLong("template_property_id"));
                        property.setCode(resultSet.getString("template_property_code"));

                        valueType.setType(resultSet.getString("value_type"));

                        property.setValueType(valueType);

                        template.getProperties().add(property);
                    }
                    while (resultSet.next());
                }
            }
            catch (Throwable t)
            {
                logger.error("Failed to get entity template.", t);
            }
            finally
            {
                closeStatement(statement);
                closeConnection(connection);
            }
        }
        else
        {
            logger.error("Null template code.");
        }

        return template;
    }

    private Map<String, Long> loadCatalog(String catalogCode)
    {
        Map<String, Long> catalog = null;

        if (catalogCode != null)
        {
            logger.info(String.format("Loading catalog: %s", catalogCode));

            Connection connection = null;
            PreparedStatement statement = null;

            try
            {
                connection = dataSource.getConnection();
                statement = connection.prepareStatement(GET_CATALOG_SQL);

                statement.setString(1, catalogCode.toUpperCase());

                ResultSet resultSet = statement.executeQuery();

                if (resultSet.first())
                {
                    catalog = new HashMap<String, Long>();

                    do
                    {
                        catalog.put(resultSet.getString("entity_name"),
                                resultSet.getLong("entity_id"));
                    }
                    while (resultSet.next());
                }
            }
            catch (Throwable t)
            {
                logger.error("Failed to get catalog.", t);
            }
            finally
            {
                closeStatement(statement);
                closeConnection(connection);
            }
        }
        else
        {
            logger.error("Null catalog code.");
        }

        return catalog;
    }

    private static void closeStatement(Statement statement)
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

    private static void closeConnection(Connection connection)
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

    public EntityTemplate getEntityTemplate(String templateCode)
    {
        return (EntityTemplate) getCachedObject(templateCode, ObjectType.EntityTemplate);
    }

    public Topic getTopic(String topicCode)
    {
        return (Topic) getCachedObject(topicCode, ObjectType.Topic);
    }

    @SuppressWarnings("unchecked")
    public Map<String, Long> getCatalog(String catalogCode)
    {
        return (Map<String, Long>) getCachedObject(catalogCode, ObjectType.Catalog);
    }

    private Object getCachedObject(String code, ObjectType type)
    {
        Object retVal = null;

        if (objectCache.containsKey(code))
        {
            retVal = objectCache.get(code);
        }
        else
        {
            switch (type)
            {
                case Topic:
                    retVal = loadTopic(code);
                    break;
                case EntityTemplate:
                    retVal = loadEntityTemplate(code);
                    break;
                case Catalog:
                    retVal = loadCatalog(code);
                    break;
            }

            if (retVal != null)
            {
                synchronized (objectCache)
                {
                    if (!objectCache.containsKey(code))
                    {
                        objectCache.put(code, retVal);
                    }
                }
            }
        }

        return retVal;
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