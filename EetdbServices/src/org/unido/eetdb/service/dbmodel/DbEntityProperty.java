package org.unido.eetdb.service.dbmodel;

public class DbEntityProperty extends DbGenericEntity
{
    private String                   value;
    private Object                   valueBlob;
    private DbEntityTemplateProperty templateProperty;
    private DbValueType              valueType;

    public DbEntityTemplateProperty getTemplateProperty()
    {
        return templateProperty;
    }

    public void setTemplateProperty(DbEntityTemplateProperty templateProperty)
    {
        this.templateProperty = templateProperty;
    }

    public String getValue()
    {
        return value;
    }

    public void setValue(String value)
    {
        this.value = value;
    }

    public Object getValueBlob()
    {
        return valueBlob;
    }

    public void setValueBlob(Object valueBlob)
    {
        this.valueBlob = valueBlob;
    }

    public DbValueType getValueType()
    {
        return valueType;
    }

    public void setValueType(DbValueType valueType)
    {
        this.valueType = valueType;
    }
}
