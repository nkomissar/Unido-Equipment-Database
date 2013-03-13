package org.unido.eetdb.daemon.parser;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.unido.eetdb.common.model.Entity;
import org.unido.eetdb.common.model.EntityProperty;
import org.unido.eetdb.common.model.EntityTemplate;
import org.unido.eetdb.common.model.EntityTemplateProperty;
import org.unido.eetdb.common.util.CsvReader;
import org.unido.eetdb.daemon.db.DbHelper;

public class CsvParser implements Parser
{
    private static final Logger logger = Logger.getLogger(CsvParser.class);
    
    private DbHelper dbHelper;

    @Override
    public List<Entity> parse(File file)
    {
        CsvReader fileReader = null;
        List<Entity> retVal = new ArrayList<Entity>();

        try
        {
            fileReader = new CsvReader(new FileInputStream(file), Charset.forName("UTF8"));

            if(fileReader != null)
            {
                fileReader.setSkipEmptyRecords(true);

                fileReader.readHeaders();

                while (fileReader.readRecord())
                {
                    EntityTemplate template = dbHelper.getEntityTemplate(fileReader.get("CODE"));

                    if(template != null)
                    {
                        Entity entity = new Entity();

                        entity.setName(fileReader.get("TITLE"));
                        entity.setEntityTemplate(template);

                        for(EntityTemplateProperty templateProperty : template.getProperties())
                        {
                            EntityProperty property = new EntityProperty();

                            property.setTemplateProperty(templateProperty);
                            property.setValue(fileReader.get(templateProperty.getCode()));
                            
                            entity.getProperties().add(property);
                        }

                        retVal.add(entity);
                    }
                }
                
                fileReader.close();
            }
        }
        catch (FileNotFoundException ex)
        {
            logger.error(String.format("Faield to open file: %s", file), ex);
        }
        catch (IOException ex)
        {
            logger.error(String.format("Faield to parse file: %s", file), ex);
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