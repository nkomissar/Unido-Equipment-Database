package org.unido.eetdb.common.model;

import java.util.ArrayList;

public class Entity
{
    private String name;
    private ArrayList<EntityProperty> properties;

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
}
