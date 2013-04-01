package org.unido.eetdb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.MatrixVariable;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.unido.eetdb.common.model.Entity;
import org.unido.eetdb.service.DataAccessService;

@Controller
@Repository
public class EntityController
{
    private DataAccessService dataAccessService;

    @Autowired
    public void setDataAccessService(DataAccessService dataAccessService)
    {
        this.dataAccessService = dataAccessService;
    }

    @RequestMapping(method = RequestMethod.GET, value = "/entity/{id}")
    @Transactional(propagation = Propagation.REQUIRES_NEW, readOnly = true)
    public @ResponseBody
    Entity getEntity(@PathVariable Long id, @MatrixVariable(required=true) int skip_childs)
    {
        return dataAccessService.getEntity(id, skip_childs == 1 ? true : false);
    }
    
    @RequestMapping(method = RequestMethod.POST, value = "/entity")
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public @ResponseBody
    Entity createEntity(@RequestBody Entity entity)
    {
        return dataAccessService.createEntity(entity);
    }
    
    @RequestMapping(method = RequestMethod.DELETE, value = "/entity")
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public @ResponseBody
    String deleteEntity(@RequestBody Entity entity)
    {
        dataAccessService.deleteEntity(entity);
        
        return "OK";
    }
    
    @RequestMapping(method = RequestMethod.PUT, value = "/entity")
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public @ResponseBody
    Entity updateEntity(@RequestBody Entity entity)
    {
        return dataAccessService.updateEntity(entity);
    }
}