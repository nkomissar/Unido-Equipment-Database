package org.unido.eetdb.service.dbmodel;

import java.util.HashSet;
import java.util.Set;

public class DbEntity extends DbGenericEntity
{
    private String                name;
    private Set<DbEntityProperty> properties    = new HashSet<DbEntityProperty>();
    private Set<DbEntity>         childEntities = new HashSet<DbEntity>();
    private DbEntityTemplate      entityTemplate;

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public Set<DbEntityProperty> getProperties()
    {
        return properties;
    }

    public void setProperties(Set<DbEntityProperty> properties)
    {
        this.properties = properties;
    }

    public Set<DbEntity> getChildEntities()
    {
        return childEntities;
    }

    public void setChildEntities(Set<DbEntity> childEntities)
    {
        this.childEntities = childEntities;
    }

    public DbEntityTemplate getEntityTemplate()
    {
        return entityTemplate;
    }

    public void setEntityTemplate(DbEntityTemplate entityTemplate)
    {
        this.entityTemplate = entityTemplate;
    }
}
