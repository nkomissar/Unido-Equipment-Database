package org.unido.eetdb.daemon.parser;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.unido.eetdb.common.model.Entity;
import org.unido.eetdb.common.model.EntityTemplate;
import org.unido.eetdb.daemon.db.DbHelper;

public class XlsxParser implements Parser
{
    private static final Logger logger = Logger.getLogger(CsvParser.class);

    private DbHelper            dbHelper;

    @Override
    public List<Entity> parse(File file) throws Exception
    {
        List<Entity> retVal = new ArrayList<Entity>();
        Workbook wb = null;

        try
        {
            wb = WorkbookFactory.create(file);
            Map<String, Integer> headers = new HashMap<String, Integer>();

            for (int i = 0; i < wb.getNumberOfSheets(); i++)
            {
                Sheet sheet = wb.getSheetAt(i);

                for (Row row : sheet)
                {
                    if (row.getRowNum() == sheet.getFirstRowNum())
                    {
                        for (Cell cell : row)
                        {
                            headers.put(cell.getStringCellValue(), cell.getColumnIndex());
                        }
                    }
                    else
                    {
                        EntityTemplate template = dbHelper
                                .getEntityTemplate(row.getCell(headers.get("CODE"))
                                        .getStringCellValue());
                    }
                }
            }
        }
        catch (Exception ex)
        {

        }
        finally
        {
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