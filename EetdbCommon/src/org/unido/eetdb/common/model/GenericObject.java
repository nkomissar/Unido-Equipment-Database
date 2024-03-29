package org.unido.eetdb.common.model;

public abstract class GenericObject implements Comparable<GenericObject>
{
    private long   id;
    private String lastUpdatedBy;
    private int    version;

    public long getId()
    {
        return id;
    }

    public void setId(long id)
    {
        this.id = id;
    }

    public String getLastUpdatedBy()
    {
        return lastUpdatedBy;
    }

    public void setLastUpdatedBy(String lastUpdatedBy)
    {
        this.lastUpdatedBy = lastUpdatedBy;
    }

    public int getVersion()
    {
        return version;
    }

    public void setVersion(int version)
    {
        this.version = version;
    }

    public int compareTo(GenericObject obj)
    {
        if (obj == null) { return -1; }

        long anotherId = obj.getId();
        long thisId = getId();

        return thisId < anotherId ? -1 : thisId == anotherId ? 0 : 1;
    }
}