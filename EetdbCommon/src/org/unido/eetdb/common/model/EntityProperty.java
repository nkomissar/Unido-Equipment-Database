package org.unido.eetdb.common.model;

public class EntityProperty
{
    private long    id;
    private String  name;
    private boolean displayInGrid;
    private String  value;
    private String  format;
    private String  unitOfMeasure;
    private String  type;
    
    public EntityProperty(){};

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

    public String getValue()
    {
        return value;
    }

    public void setValue(String value)
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

    public long getId()
    {
        return id;
    }

    public void setId(long id)
    {
        this.id = id;
    }
}
