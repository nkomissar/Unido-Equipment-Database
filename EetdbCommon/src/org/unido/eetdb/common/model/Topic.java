package org.unido.eetdb.common.model;

import java.util.HashSet;
import java.util.Set;

public class Topic
{
    private long        id;
    private String      name;
    private String      description;
    private Set<Topic>  childTopics        = new HashSet<Topic>();
    private Set<Entity> entitiesOfTopic = new HashSet<Entity>();

    public Topic()
    {
    };

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public long getId()
    {
        return id;
    }

    public void setId(long id)
    {
        this.id = id;
    }

    public Set<Topic> getChildTopics()
    {
        return childTopics;
    }

    public void setChildTopics(Set<Topic> childTopics)
    {
        this.childTopics = childTopics;
    }

    public Set<Entity> getEntitiesOfTopic()
    {
        return entitiesOfTopic;
    }

    public void setEntitiesOfTopic(Set<Entity> entitiesOfTopic)
    {
        this.entitiesOfTopic = entitiesOfTopic;
    }

    public String getDescription()
    {
        return description;
    }

    public void setDescription(String description)
    {
        this.description = description;
    }
}