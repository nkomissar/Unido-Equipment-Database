package org.unido.eetdb.common.model;

import java.util.Set;

public class Entity
{
    private long   id;
    private String name;
    private Set    properties;
    private Set    childEntities;

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

    public Set getProperties()
    {
        return properties;
    }

    public void setProperties(Set properties)
    {
        this.properties = properties;
    }

    public Set getChildEntities()
    {
        return childEntities;
    }

    public void setChildEntities(Set childEntities)
    {
        this.childEntities = childEntities;
    }
}