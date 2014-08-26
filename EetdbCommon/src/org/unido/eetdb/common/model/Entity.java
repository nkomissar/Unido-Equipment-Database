package org.unido.eetdb.common.model;

import java.util.HashSet;
import java.util.Set;

public class Entity extends GenericObject
{
    private String              name;
    private Set<EntityProperty> properties    = new HashSet<EntityProperty>();
    private Set<Entity>         childEntities = new HashSet<Entity>();
    private Set<Topic>          parentTopics  = new HashSet<Topic>();
    private EntityTemplate      entityTemplate;
    private String		 		status;

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

	public String getStatus() 
	{
		return status;
	}

	public void setStatus(String status) 
	{
		this.status = status;
	}
	
    public boolean equals(Object obj)
    {
        if (obj == null) { return false; }

        Entity target = null;

        try
        {
        	target = (Entity) obj;
        }
        catch (ClassCastException cce)
        {
            return false;
        }

        long anotherId = target.getId();
        long thisId = getId();

        return thisId == anotherId;
    }

    public int hashCode()
    {
        long value = getId();
        return (int) (value ^ (value >>> 32));
    }
}