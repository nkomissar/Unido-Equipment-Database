package org.unido.eetdb.daemon.db;

import java.util.List;

import javax.sql.DataSource;

import org.unido.eetdb.common.model.Entity;

public class DbWriter
{
    private DataSource dataSource;
    
    public boolean persistEntities(List<Entity> entities)
    {
        return false;
    }

    public DataSource getDataSource()
    {
        return dataSource;
    }

    public void setDataSource(DataSource dataSource)
    {
        this.dataSource = dataSource;
    }
}
