package org.unido.eetdb.common.model;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

public class Entity
{
    private long                        id;
    private String                      name;
    private String                      entityType;
    private Map<String, EntityProperty> properties    = new HashMap<String, EntityProperty>();
    private Set<Entity>                 childEntities = new HashSet<Entity>();

    public Entity()
    {
    };

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public long getId()
    {
        return id;
    }

    public void setId(long id)
    {
        this.id = id;
    }

    public Set<Entity> getChildEntities()
    {
        return childEntities;
    }

    public void setChildEntities(Set<Entity> childEntities)
    {
        this.childEntities = childEntities;
    }

    public String getEntityType()
    {
        return entityType;
    }

    public void setEntityType(String entityType)
    {
        this.entityType = entityType;
    }

    public Map<String, EntityProperty> getProperties()
    {
        return properties;
    }

    public void setProperties(Map<String, EntityProperty> properties)
    {
        this.properties = properties;
    }
}