package org.unido.eetdb.service.dbmodel;

import java.util.HashSet;
import java.util.Set;

public class DbEntityTemplate extends DbGenericEntity
{
    private String                        name;
    private String                        code;
    private Set<DbEntityTemplateProperty> properties = new HashSet<DbEntityTemplateProperty>();

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public Set<DbEntityTemplateProperty> getProperties()
    {
        return properties;
    }

    public void setProperties(Set<DbEntityTemplateProperty> properties)
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
}
