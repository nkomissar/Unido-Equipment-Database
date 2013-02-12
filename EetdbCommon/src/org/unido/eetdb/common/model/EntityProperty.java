package org.unido.eetdb.common.model;

public class EntityProperty
{
    private String  name;
    private boolean displayInGrid;
    private Object  value;
    private String  format;
    private String  unitOfMeasure;
    private String  type;

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public boolean isDisplayInGrid()
    {
        return displayInGrid;
    }

    public void setDisplayInGrid(boolean displayInGrid)
    {
        this.displayInGrid = displayInGrid;
    }

    public Object getValue()
    {
        return value;
    }

    public void setValue(Object value)
    {
        this.value = value;
    }

    public String getFormat()
    {
        return format;
    }

    public void setFormat(String format)
    {
        this.format = format;
    }

    public String getUnitOfMeasure()
    {
        return unitOfMeasure;
    }

    public void setUnitOfMeasure(String unitOfMeasure)
    {
        this.unitOfMeasure = unitOfMeasure;
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
