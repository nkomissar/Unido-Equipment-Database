package org.unido.eetdb.daemon.parser;

import java.io.File;
import java.io.FileInputStream;
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
import org.unido.eetdb.daemon.db.DbHelper;

public class XlsxParser implements Parser
{
    private static final Logger logger = Logger.getLogger(XlsxParser.class);

    private DbHelper            dbHelper;

    @Override
    public List<Entity> parse(File file) throws Exception
    {
        List<Entity> retVal = new ArrayList<Entity>();
        Workbook wb = null;
        FileInputStream fileIn = new FileInputStream(file);

        try
        {
            wb = WorkbookFactory.create(fileIn);
            Map<String, Integer> headers = new HashMap<String, Integer>();

            for (int i = 0; i < wb.getNumberOfSheets(); i++)
            {
                Sheet sheet = wb.getSheetAt(i);
                RowDataAccessor dataAccessor = new RowDataAccessor();

                for (Row row : sheet)
                {
                    if (row.getRowNum() == sheet.getFirstRowNum())
                    {
                        for (Cell cell : row)
                        {
                            headers.put(cell.getStringCellValue(), cell.getColumnIndex());
                        }

                        dataAccessor.setHeaders(headers);
                    }
                    else
                    {
                        dataAccessor.setDataRow(row);

                        Entity entity = Parser.entityFiller.fillEntity(dataAccessor, dbHelper);

                        if (entity != null)
                        {
                            retVal.add(entity);
                        }
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
            fileIn.close();
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

    private class RowDataAccessor implements DataAccessor
    {
        private Row                  dataRow;
        private Map<String, Integer> headers;

        @Override
        public String readValue(String valueCode)
        {
            String retVal = null;

            try
            {
                if (headers.containsKey(valueCode))
                {
                    Cell cell = dataRow.getCell(headers.get(valueCode), Row.RETURN_BLANK_AS_NULL);

                    if (cell != null)
                    {
                        switch (cell.getCellType())
                        {
                            case Cell.CELL_TYPE_STRING:
                                retVal = cell.getStringCellValue();
                                break;
                            case Cell.CELL_TYPE_NUMERIC:
                                retVal = String.valueOf(cell.getNumericCellValue());
                                break;
                        }
                    }
                }
            }
            catch (Exception e)
            {
                logger.error(String.format("Failed to get column data: %s", valueCode));
            }

            return retVal;
        }

        public void setDataRow(Row dataRow)
        {
            this.dataRow = dataRow;
        }

        public void setHeaders(Map<String, Integer> headers)
        {
            this.headers = headers;
        }
    }
}