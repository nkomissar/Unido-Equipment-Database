package org.unido.eetdb.common.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

public class EntityTemplateProperty extends GenericObject
{
    private String         name;
    private String         code;
    private boolean        displayInGrid;
    private boolean        mandatory;
    private boolean        searchable;
    private String         unitOfMeasure;
    private EntityTemplate parentTemplate;
    private ValueType      valueType;

    public String getName()
    {
        return name;
    }
    public void setName(String name)
    {
        this.name = name;
    }
    
    public String getCode()
    {
        return code;
    }
    public void setCode(String code)
    {
        this.code = code;
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
    
    @JsonIgnore
    public EntityTemplate getParentTemplate()
    {
        return parentTemplate;
    }
    public void setParentTemplate(EntityTemplate parentTemplate)
    {
        this.parentTemplate = parentTemplate;
    }
    
    public ValueType getValueType()
    {
        return valueType;
    }
    public void setValueType(ValueType valueType)
    {
        this.valueType = valueType;
    }

    public boolean isSearchable()
    {
        return searchable;
    }
    public void setSearchable(boolean searchable)
    {
        this.searchable = searchable;
    }
}