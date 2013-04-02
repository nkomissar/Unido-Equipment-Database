package org.unido.eetdb.common.model;

import java.util.HashSet;
import java.util.Set;

public class Entity extends GenericObject
{
    private String              name;
    private Set<EntityProperty> properties    = new HashSet<EntityProperty>();
    private Set<Entity>         childEntities = new HashSet<Entity>();
    private Set<Topic>          parentTopics = new HashSet<Topic>();
    private EntityTemplate      entityTemplate;

    public String getName()
    {
        return name;
    }
    public void setName(String name)
    {
        this.name = name;
    }
    
    public Set<EntityProperty> getProperties()
    {
        return properties;
    }
    public void setProperties(Set<EntityProperty> properties)
    {
        this.properties = properties;
    }
    
    public Set<Entity> getChildEntities()
    {
        return childEntities;
    }
    public void setChildEntities(Set<Entity> childEntities)
    {
        this.childEntities = childEntities;
    }

    public EntityTemplate getEntityTemplate()
    {
        return entityTemplate;
    }
    public void setEntityTemplate(EntityTemplate entityTemplate)
    {
        this.entityTemplate = entityTemplate;
    }

    public Set<Topic> getParentTopics()
    {
        return parentTopics;
    }
    public void setParentTopics(Set<Topic> parentTopics)
    {
        this.parentTopics = parentTopics;
    }
}