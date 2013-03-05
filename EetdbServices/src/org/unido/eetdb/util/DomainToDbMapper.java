package org.unido.eetdb.util;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

import org.apache.log4j.Logger;
import org.unido.eetdb.common.model.EntityTemplate;
import org.unido.eetdb.common.model.EntityTemplateProperty;
import org.unido.eetdb.service.dbmodel.DbEntityTemplate;
import org.unido.eetdb.service.dbmodel.DbEntityTemplateProperty;

public class DomainToDbMapper
{
    private static final Logger logger = Logger.getLogger(DomainToDbMapper.class);

    public static DbEntityTemplate mapEntityTemplate(EntityTemplate entityTemplate)
    {
        DbEntityTemplate dbTemplate = new DbEntityTemplate();

        dbTemplate.setId(entityTemplate.getId());
        dbTemplate.setName(entityTemplate.getName());

        dbTemplate.setLastUpdatedBy("System");
        
        dbTemplate.setLastUpdatedDate
        (
                entityTemplate.getLastUpdatedDate() == 0 ?
                null :
                new Timestamp(entityTemplate.getLastUpdatedDate())
        );

        dbTemplate.setProperties(mapEntityTemplateProperties(entityTemplate.getProperties(), dbTemplate));

        return dbTemplate;
    }
    
    public static Set<DbEntityTemplateProperty> mapEntityTemplateProperties(
            Set<EntityTemplateProperty> properties, DbEntityTemplate parentTemplate)
    {
        Set<DbEntityTemplateProperty> dbProperties = new HashSet<DbEntityTemplateProperty>();

        for (EntityTemplateProperty property : properties)
        {
            dbProperties.add(mapEntityTemplateProperty(property, parentTemplate));
        }

        return dbProperties;
    }
    
    public static DbEntityTemplateProperty mapEntityTemplateProperty(
            EntityTemplateProperty templateProperty, DbEntityTemplate parentTemplate)
    {
        DbEntityTemplateProperty dbTemplateProperty = new DbEntityTemplateProperty();

        dbTemplateProperty.setId(templateProperty.getId());
        dbTemplateProperty.setName(templateProperty.getName());
        dbTemplateProperty.setDisplayInGrid(templateProperty.isDisplayInGrid());
        dbTemplateProperty.setMandatory(templateProperty.isMandatory());
        dbTemplateProperty.setUnitOfMeasure(templateProperty.getUnitOfMeasure());
        
        dbTemplateProperty.setParentTemplate(parentTemplate);

        dbTemplateProperty.setLastUpdatedBy("System");
        dbTemplateProperty.setLastUpdatedDate
        (
                templateProperty.getLastUpdatedDate() == 0 ?
                null :
                new Timestamp(templateProperty.getLastUpdatedDate())
        );

        return dbTemplateProperty;
    }
}