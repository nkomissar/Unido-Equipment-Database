package org.unido.eetdb.service;

import java.io.Serializable;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.log4j.Logger;
import org.hibernate.HibernateException;
import org.hibernate.engine.spi.SessionImplementor;
import org.hibernate.id.IdentifierGenerator;

public class IdGenerator implements IdentifierGenerator
{
    private static final Logger logger = Logger.getLogger(IdGenerator.class);

    @Override
    public Serializable generate(SessionImplementor session, Object object)
            throws HibernateException
    {
        Connection connection = session.connection();

        try
        {
            CallableStatement statement = connection.prepareCall("select SEQ_NEXTVAL()");

            ResultSet rs = statement.executeQuery();

            rs.first();

            return rs.getLong(1);
        }
        catch (SQLException ex)
        {
            logger.error(ex);

            throw new HibernateException("Unable to generate id");
        }
    }
}