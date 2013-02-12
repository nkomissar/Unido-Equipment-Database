package org.unido.eetdb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.unido.eetdb.common.model.Entity;
import org.unido.eetdb.common.model.Topic;
import org.unido.eetdb.service.EntityService;

@Controller
public class EntityController
{
    private EntityService entityService;

    @Autowired
    public void setEntityService(EntityService entityService)
    {
        this.entityService = entityService;
    }

    @RequestMapping(method = RequestMethod.GET, value = "/entity/{id}", headers = "application/json")
    public @ResponseBody
    Entity getEntity(@PathVariable long id)
    {
        Entity entity = entityService.getEntity(id, true);

        return entity;
    }
    
    @RequestMapping(method = RequestMethod.GET, value = "/topic/{id}", headers = "application/json")
    public @ResponseBody
    Topic getTopic(@PathVariable long id)
    {
        Topic topic = entityService.getTopic(id);

        return topic;
    }
}