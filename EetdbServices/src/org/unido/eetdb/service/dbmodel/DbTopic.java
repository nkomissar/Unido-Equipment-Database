package org.unido.eetdb.service.dbmodel;

import java.util.Set;

public class DbTopic extends DbGenericEntity
{
    private String        name;
    private Set<DbEntity> entitiesOfTopic;
    private Set<DbTopic>  childTopics;

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public Set<DbEntity> getEntitiesOfTopic()
    {
        return entitiesOfTopic;
    }

    public void setEntitiesOfTopic(Set<DbEntity> entitiesOfTopic)
    {
        this.entitiesOfTopic = entitiesOfTopic;
    }

    public Set<DbTopic> getChildTopics()
    {
        return childTopics;
    }

    public void setChildTopics(Set<DbTopic> childTopics)
    {
        this.childTopics = childTopics;
    }
}
