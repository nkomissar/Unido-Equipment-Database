package org.unido.eetdb.service.dbmodel;

import java.sql.Timestamp;

public abstract class DbGenericEntity
{
    private long      id;
    private Timestamp lastUpdatedDate;
    private String    lastUpdatedBy;

    public Timestamp getLastUpdatedDate()
    {
        return lastUpdatedDate;
    }

    public void setLastUpdatedDate(Timestamp lastUpdatedDate)
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
