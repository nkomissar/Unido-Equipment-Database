package org.unido.eetdb.service;

import org.unido.eetdb.common.model.Entity;
import org.unido.eetdb.common.model.Topic;

public interface EntityService
{
    public Entity getEntity(Long entityId, boolean loadChilds);
    
    public Topic getTopic(Long topicId);
}