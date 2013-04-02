package org.unido.eetdb.daemon.parser;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.unido.eetdb.common.model.Entity;
import org.unido.eetdb.common.util.CsvReader;
import org.unido.eetdb.daemon.db.DbHelper;

public class CsvParser implements Parser
{
    private static final Logger logger = Logger.getLogger(CsvParser.class);

    private DbHelper            dbHelper;

    @Override
    public List<Entity> parse(File file) throws Exception
    {
        CsvReader fileReader = null;
        List<Entity> retVal = new ArrayList<Entity>();

        fileReader = new CsvReader(new FileInputStream(file), Charset.defaultCharset());

        try
        {
            if (fileReader != null)
            {
                fileReader.setSkipEmptyRecords(true);

                fileReader.readHeaders();

                if (fileReader.getHeaderCount() <= 1)
                {
                    logger.info("Couldn't get columns in data file, maybe wrong delimeter...");

                    fileReader.close();
                    fileReader = new CsvReader(new FileInputStream(file), Charset.defaultCharset());

                    fileReader.setDelimiter(';');
                    fileReader.readHeaders();

                    if (fileReader.getHeaderCount() <= 1)
                    {
                        logger.error("Failed to get columns, possible wrong format...");

                        throw new Exception("Failed to parse fail structure.");
                    }
                }

                final CsvReader fileReaderClousure = fileReader;

                while (fileReaderClousure.readRecord())
                {
                    Entity entity = Parser.entityFiller.fillEntity(
                            new DataAccessor()
                            {
                                @Override
                                public String readValue(String valueCode)
                                {
                                    String retVal = null;

                                    try
                                    {
                                        retVal = fileReaderClousure.get(valueCode);
                                    }
                                    catch (IOException e)
                                    {
                                        logger.error(String.format("Failed to get column data: %s",
                                                valueCode));
                                    }

                                    return retVal;
                                }
                            }
                            , dbHelper);

                    if (entity != null)
                    {
                        retVal.add(entity);
                    }
                }
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            fileReader.close();
        }

        return retVal;
    }

    public DbHelper getDbHelper()
    {
        return dbHelper;
    }

    public void setDbHelper(DbHelper dbHelper)
    {
        this.dbHelper = dbHelper;
    }
}