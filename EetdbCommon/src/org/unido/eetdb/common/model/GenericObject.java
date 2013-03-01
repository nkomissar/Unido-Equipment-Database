package org.unido.eetdb.common.model;

public abstract class GenericObject
{
    private long id;
    private long lastUpdatedDate;

    public long getId()
    {
        return id;
    }

    public void setId(long id)
    {
        this.id = id;
    }

    public long getLastUpdatedDate()
    {
        return lastUpdatedDate;
    }

    public void setLastUpdatedDate(long lastUpdatedDate)
    {
        this.lastUpdatedDate = lastUpdatedDate;
    }
}