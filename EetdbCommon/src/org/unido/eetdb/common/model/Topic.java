package org.unido.eetdb.common.model;

import java.util.HashSet;
import java.util.Set;

public class Topic extends GenericObject
{
    private String      name;
    private String      description;
    private Set<Entity> entitiesOfTopic = new HashSet<Entity>();
    private Set<Topic>  childTopics = new HashSet<Topic>();
    
    public String getName()
    {
        return name;
    }
    public void setName(String name)
    {
        this.name = name;
    }
    
    public String getDescription()
    {
        return description;
    }
    public void setDescription(String description)
    {
        this.description = description;
    }
    
    public Set<Entity> getEntitiesOfTopic()
    {
        return entitiesOfTopic;
    }
    public void setEntitiesOfTopic(Set<Entity> entitiesOfTopic)
    {
        this.entitiesOfTopic = entitiesOfTopic;
    }
    
    public Set<Topic> getChildTopics()
    {
        return childTopics;
    }
    public void setChildTopics(Set<Topic> childTopics)
    {
        this.childTopics = childTopics;
    }
}