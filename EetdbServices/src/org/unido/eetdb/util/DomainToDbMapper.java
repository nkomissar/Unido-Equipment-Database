package org.unido.eetdb.util;

import java.util.HashSet;
import java.util.Set;

import org.unido.eetdb.common.model.EntityTemplate;
import org.unido.eetdb.common.model.EntityTemplateProperty;
import org.unido.eetdb.service.dbmodel.DbEntityTemplate;
import org.unido.eetdb.service.dbmodel.DbEntityTemplateProperty;

public class DomainToDbMapper
{
    public static DbEntityTemplate mapEntityTemplate(EntityTemplate entityTemplate)
    {
        DbEntityTemplate dbTemplate = new DbEntityTemplate();

        dbTemplate.setId(entityTemplate.getId());
        dbTemplate.setName(entityTemplate.getName());

        dbTemplate.setLastUpdatedBy("System");
        dbTemplate.setLastUpdatedDate(entityTemplate.getLastUpdatedDate());

        dbTemplate.setProperties(mapEntityTemplateProperties(entityTemplate.getProperties()));

        return dbTemplate;
    }
    
    public static Set<DbEntityTemplateProperty> mapEntityTemplateProperties(
            Set<EntityTemplateProperty> properties)
    {
        Set<DbEntityTemplateProperty> dbProperties = new HashSet<DbEntityTemplateProperty>();

        for (EntityTemplateProperty property : properties)
        {
            dbProperties.add(mapEntityTemplateProperty(property));
        }

        return dbProperties;
    }
    
    public static DbEntityTemplateProperty mapEntityTemplateProperty(
            EntityTemplateProperty templateProperty)
    {
        DbEntityTemplateProperty dbTemplateProperty = new DbEntityTemplateProperty();

        dbTemplateProperty.setId(templateProperty.getId());
        dbTemplateProperty.setName(templateProperty.getName());
        dbTemplateProperty.setDisplayInGrid(templateProperty.isDisplayInGrid());
        dbTemplateProperty.setMandatory(templateProperty.isMandatory());
        dbTemplateProperty.setUnitOfMeasure(templateProperty.getUnitOfMeasure());

        dbTemplateProperty.setLastUpdatedBy("System");
        dbTemplateProperty.setLastUpdatedDate(templateProperty.getLastUpdatedDate());

        return dbTemplateProperty;
    }
}