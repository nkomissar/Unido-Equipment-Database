package org.unido.eetdb.service.dbmodel;

import java.util.Date;

public abstract class DbGenericEntity
{
    private long   id;
    private Date   lastUpdatedDate;
    private String lastUpdatedBy;

    public Date getLastUpdatedDate()
    {
        return lastUpdatedDate;
    }

    public void setLastUpdatedDate(Date lastUpdatedDate)
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
