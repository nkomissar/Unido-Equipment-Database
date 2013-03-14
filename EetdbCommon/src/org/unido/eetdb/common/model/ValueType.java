package org.unido.eetdb.common.model;

public class ValueType extends GenericObject
{
    private String format;
    private String type;
    
    public String getFormat()
    {
        return format;
    }
    public void setFormat(String format)
    {
        this.format = format;
    }
    
    public String getType()
    {
        return type;
    }
    public void setType(String type)
    {
        this.type = type;
    }
}