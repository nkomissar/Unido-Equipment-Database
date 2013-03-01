package org.unido.eetdb.service.dbmodel;

public abstract class DbGenericEntity
{
    private long   id;
    private long   lastUpdatedDate;
    private String lastUpdatedBy;

    public long getLastUpdatedDate()
    {
        return lastUpdatedDate;
    }

    public void setLastUpdatedDate(long lastUpdatedDate)
    {
        this.lastUpdatedDate = lastUpdatedDate;
    }

    public String getLastUpdatedBy()
    {
        return lastUpdatedBy;
    }

    public void setLastUpdatedBy(String lastUpdatedBy)
    {
        this.lastUpdatedBy = lastUpdatedBy;
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
