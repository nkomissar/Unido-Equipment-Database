package org.unido.eetdb.common.model;

import java.util.HashSet;
import java.util.Set;

public class EntityTemplate extends GenericObject
{
    private String                      name;
    private Set<EntityTemplateProperty> properties = new HashSet<EntityTemplateProperty>();

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public Set<EntityTemplateProperty> getProperties()
    {
        return properties;
    }

    public void setProperties(Set<EntityTemplateProperty> properties)
    {
        this.properties = properties;
    }
}
