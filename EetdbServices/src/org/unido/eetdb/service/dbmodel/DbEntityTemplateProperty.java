package org.unido.eetdb.service.dbmodel;

public class DbEntityTemplateProperty extends DbGenericEntity
{
    private String           name;
    private String           code;
    private boolean          displayInGrid;
    private boolean          mandatory;
    private String           unitOfMeasure;
    private DbEntityTemplate parentTemplate;

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

    public DbEntityTemplate getParentTemplate()
    {
        return parentTemplate;
    }

    public void setParentTemplate(DbEntityTemplate parentTemplate)
    {
        this.parentTemplate = parentTemplate;
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
