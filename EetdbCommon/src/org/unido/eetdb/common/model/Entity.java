package org.unido.eetdb.common.model;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

public class Entity extends GenericObject
{
    private long                typeId;
    private String              name;
    private String              entityType;
    private Set<EntityProperty> properties    = new HashSet<EntityProperty>();
    private Set<Entity>         childEntities = new HashSet<Entity>();

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

    public long getTypeId()
    {
        return typeId;
    }

    public void setTypeId(long typeId)
    {
        this.typeId = typeId;
    }

    public Set<EntityProperty> getProperties()
    {
        return properties;
    }

    public void setProperties(Set<EntityProperty> properties)
    {
        this.properties = properties;
    }
}