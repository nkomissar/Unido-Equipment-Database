package org.unido.eetdb.service;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.unido.eetdb.common.model.Entity;

@Repository
public class EntityServiceImpl implements EntityService
{
    private JdbcTemplate jdbcTemplate;

    @Override
    public Entity getEntity(int entityId)
    {
        return null;
    }

    @Autowired
    public void setDataSource(DataSource dataSource)
    {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }
}