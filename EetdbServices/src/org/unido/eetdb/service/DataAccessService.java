package org.unido.eetdb.service;

import java.util.List;
import java.util.Set;

import org.unido.eetdb.common.model.Entity;
import org.unido.eetdb.common.model.EntitySearchResult;
import org.unido.eetdb.common.model.EntityTemplate;
import org.unido.eetdb.common.model.Topic;
import org.unido.eetdb.common.model.UploadError;
import org.unido.eetdb.common.model.UploadItem;
import org.unido.eetdb.common.model.ValueBlob;
import org.unido.eetdb.common.model.ValueType;

public interface DataAccessService
{
    public Entity getEntity(Long entityId, boolean skipChilds);
    public Entity createEntity(Entity entity);
    public Entity updateEntity(Entity entity);
    public void deleteEntity(Entity entity);
    public Set<Entity> getEntitiesByTemplateCode(String code);
    public Set<Entity> getEntitiesByTopic(Long topicId);

    public Topic getTopic(Long topicId);
    public Topic createTopic(Topic topic);
    public Topic updateTopic(Topic topic);
    public void deleteTopic(Topic topic);
    public Set<Topic> getRootTopics();

    public EntityTemplate getEntityTemplate(Long templateId, boolean skipChilds);
    public Set<EntityTemplate> getEntityTemplates();
    public EntityTemplate createEntityTemplate(EntityTemplate template);
    public EntityTemplate updateEntityTemplate(EntityTemplate template);
    public void deleteEntityTemplate(EntityTemplate template);
    
    public Set<ValueType> getValueTypes();
    
    public List<Topic> searchForTopics(String param);
    public List<EntitySearchResult> searchForEntities(String param);
    public List<Entity> searchForEntities(String templateCode, String params);
    
    public ValueBlob getValueBlob(Long blobId);
    public Set<ValueBlob> getValueBlobMetaForEntity(Long entityId);
    public ValueBlob saveValueBlob(ValueBlob valueBlob, byte[] blobData);

    public UploadItem getUploadItem(Long uploadItemId);
    public Set<UploadItem> getUploadItems();
    
    public Set<UploadError> getUploadErrors(Long uploadItemId);
    

}