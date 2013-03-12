package org.unido.eetdb.daemon.db;

import java.util.HashMap;
import java.util.Map;

import org.unido.eetdb.common.model.EntityTemplate;

public final class DbHelper
{
    private final static Map<String, EntityTemplate> templates = new HashMap<String, EntityTemplate>();
    
    public static EntityTemplate getEntityTemplate(String templateCode)
    {
        EntityTemplate retVal = null;
        
        if(templates.containsKey(templateCode))
        {
            retVal = templates.get(templateCode);
        }
        else
        {
            retVal = loadEntityTemplate(templateCode);

            synchronized(templates)
            {
                if(!templates.containsKey(templateCode))
                {
                    templates.put(retVal.getCode(), retVal);
                }
            }
        }
        
        return retVal;
    }
    
    private static EntityTemplate loadEntityTemplate(String templateCode)
    {
        return null;
    }
}
