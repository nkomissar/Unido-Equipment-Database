package org.unido.eetdb.common.model;

public class BusinessSector
{
    private int Id;
    private String sectorName;
    private String description;

    public int getId()
    {
        return Id;
    }

    public void setId(int id)
    {
        Id = id;
    }
    
    public String getSectorName()
    {
        return sectorName;
    }
    
    public void setSectorName(String sectorName)
    {
        this.sectorName = sectorName;
    }
    
    public String getDescription()
    {
        return description;
    }

    public void setDescription(String description)
    {
        this.description = description;
    }
}