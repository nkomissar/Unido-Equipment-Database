package org.unido.eetdb.service.dbmodel;

public class DbEntityProperty extends DbGenericEntity
{
    private DbEntityTemplateProperty templateProperty;

    public DbEntityTemplateProperty getTemplateProperty()
    {
        return templateProperty;
    }

    public void setTemplateProperty(DbEntityTemplateProperty templateProperty)
    {
        this.templateProperty = templateProperty;
    }
}
