package org.unido.eetdb.common.model;

public class EntityProperty extends GenericObject
{
    private String                 value;
    private Object                 valueBlob;
    private EntityTemplateProperty templateProperty;

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

    public EntityTemplateProperty getTemplateProperty()
    {
        return templateProperty;
    }
    public void setTemplateProperty(EntityTemplateProperty templateProperty)
    {
        this.templateProperty = templateProperty;
    }
}