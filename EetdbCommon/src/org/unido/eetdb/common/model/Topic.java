package org.unido.eetdb.common.model;

import java.util.HashSet;
import java.util.Set;

public class Topic
{
    private long        id;
    private String      name;
    private Set<Topic>  childTopics        = new HashSet<Topic>();
    private Set<Entity> entitiesOfTheTopic = new HashSet<Entity>();

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

    public Set<Entity> getEntitiesOfTheTopic()
    {
        return entitiesOfTheTopic;
    }

    public void setEntitiesOfTheTopic(Set<Entity> entitiesOfTheTopic)
    {
        this.entitiesOfTheTopic = entitiesOfTheTopic;
    }
}