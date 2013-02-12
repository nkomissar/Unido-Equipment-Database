package org.unido.eetdb.common.model;

import java.util.ArrayList;

public class Entity
{
    private long                      id;
    private String                    name;
    private ArrayList<EntityProperty> properties;
    private ArrayList<Entity>         childEntities;
    
    public Entity(){};

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public ArrayList<EntityProperty> getProperties()
    {
        return properties;
    }

    public void setProperties(ArrayList<EntityProperty> properties)
    {
        this.properties = properties;
    }

    public ArrayList<Entity> getChildEntities()
    {
        return childEntities;
    }

    public void setChildEntities(ArrayList<Entity> childEntities)
    {
        this.childEntities = childEntities;
    }

    public long getId()
    {
        return id;
    }

    public void setId(long id)
    {
        this.id = id;
    }
}