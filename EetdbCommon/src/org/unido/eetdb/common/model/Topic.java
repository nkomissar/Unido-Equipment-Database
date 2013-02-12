package org.unido.eetdb.common.model;

import java.util.ArrayList;

public class Topic
{
    private long              id;
    private String            name;
    private ArrayList<Topic>  childTopics;
    private ArrayList<Entity> entitiesOfTheTopic;
    
    public Topic(){};

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public ArrayList<Topic> getChildTopics()
    {
        return childTopics;
    }

    public void setChildTopics(ArrayList<Topic> childTopics)
    {
        this.childTopics = childTopics;
    }

    public ArrayList<Entity> getEntitiesOfTheTopic()
    {
        return entitiesOfTheTopic;
    }

    public void setEntitiesOfTheTopic(ArrayList<Entity> entitiesOfTheTopic)
    {
        this.entitiesOfTheTopic = entitiesOfTheTopic;
    }

    public long getId()
    {
        return id;
    }

    public void setId(long id)
    {
        this.id = id;
    }
}