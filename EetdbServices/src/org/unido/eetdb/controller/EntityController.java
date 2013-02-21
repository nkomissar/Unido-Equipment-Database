package org.unido.eetdb.controller;

import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.unido.eetdb.common.model.Entity;
import org.unido.eetdb.common.model.Topic;
import org.unido.eetdb.service.DataAccessService;

@Controller
public class EntityController
{
    private DataAccessService dataAccessService;

    @Autowired
    public void setDataAccessService(DataAccessService dataAccessService)
    {
        this.dataAccessService = dataAccessService;
    }

    @RequestMapping(method = RequestMethod.GET, value = "/entity/{id}")
    public @ResponseBody
    Entity getEntity(@PathVariable Long id)
    {
        Entity entity = dataAccessService.getEntity(id, true);

        return entity;
    }
    
    @RequestMapping(method = RequestMethod.GET, value = "/topic/{id}")
    public @ResponseBody
    Topic getTopic(@PathVariable Long id)
    {
        Topic topic = dataAccessService.getTopic(id);

        return topic;
    }
    
    @RequestMapping(method = RequestMethod.GET, value = "/topics")
    public @ResponseBody
    Set<Topic> getTopics()
    {
        return null;
    }
}