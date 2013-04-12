package org.unido.eetdb.common.model;

import java.util.HashSet;
import java.util.Set;

public class EntityTemplate extends GenericObject
{
    private String                      name;
    private String                      code;
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

    public String getCode()
    {
        return code;
    }
    public void setCode(String code)
    {
        this.code = code;
    }
    
    public boolean equals(Object obj)
    {
        if (obj == null) { return false; }

        EntityTemplate target = null;

        try
        {
        	target = (EntityTemplate) obj;
        }
        catch (ClassCastException cce)
        {
            return false;
        }

        long anotherId = target.getId();
        long thisId = getId();

        return thisId == anotherId;
    }

    public int hashCode()
    {
        long value = getId();
        return (int) (value ^ (value >>> 32));
    }
}
