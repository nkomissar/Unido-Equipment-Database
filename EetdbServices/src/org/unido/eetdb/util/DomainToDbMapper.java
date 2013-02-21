package org.unido.eetdb.util;

import org.unido.eetdb.common.model.EntityTemplate;
import org.unido.eetdb.service.dbmodel.DbEntityTemplate;

public class DomainToDbMapper
{
    public static DbEntityTemplate mapEntityTemplate(EntityTemplate entityTemplate)
    {
        DbEntityTemplate dbTemplate = new DbEntityTemplate();

        dbTemplate.setId(entityTemplate.getId());
        dbTemplate.setName(entityTemplate.getName());

        //template.setProperties(mapEntityTemplateProperties(dbEntityTemplate.getProperties()));

        return dbTemplate;
    }
}
