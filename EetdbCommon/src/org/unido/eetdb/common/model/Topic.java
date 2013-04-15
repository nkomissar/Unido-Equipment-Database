package org.unido.eetdb.common.model;

import java.util.HashSet;
import java.util.Set;

public class Topic extends GenericObject
{
    private String      name;
    private String      description;
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
    
    public Set<Topic> getChildTopics()
    {
        return childTopics;
    }
    public void setChildTopics(Set<Topic> childTopics)
    {
        this.childTopics = childTopics;
    }
}