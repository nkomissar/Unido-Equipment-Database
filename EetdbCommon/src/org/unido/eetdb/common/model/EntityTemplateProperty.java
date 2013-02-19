package org.unido.eetdb.common.model;

public class EntityTemplateProperty extends GenericObject
{
    private String  name;
    private boolean displayInGrid;
    private boolean mandatory;
    private String  unitOfMeasure;

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

    public boolean isMandatory()
    {
        return mandatory;
    }

    public void setMandatory(boolean mandatory)
    {
        this.mandatory = mandatory;
    }

    public String getUnitOfMeasure()
    {
        return unitOfMeasure;
    }

    public void setUnitOfMeasure(String unitOfMeasure)
    {
        this.unitOfMeasure = unitOfMeasure;
    }
}
