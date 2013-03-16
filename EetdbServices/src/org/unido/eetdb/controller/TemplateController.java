package org.unido.eetdb.controller;

import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.unido.eetdb.common.model.EntityTemplate;
import org.unido.eetdb.common.model.ValueType;
import org.unido.eetdb.service.DataAccessService;

@Controller
public class TemplateController
{
    private DataAccessService dataAccessService;

    @Autowired
    public void setDataAccessService(DataAccessService dataAccessService)
    {
        this.dataAccessService = dataAccessService;
    }
    
    @RequestMapping(method = RequestMethod.GET, value = "/value-types")
    @Transactional(propagation = Propagation.REQUIRES_NEW, readOnly = true)
    public @ResponseBody
    Set<ValueType> getValueTypes()
    {
        return dataAccessService.getValueTypes();
    }

    @RequestMapping(method = RequestMethod.GET, value = "/template/{id}")
    @Transactional(propagation = Propagation.REQUIRES_NEW, readOnly = true)
    public @ResponseBody
    EntityTemplate getTemplate(@PathVariable Long id)
    {
        return dataAccessService.getEntityTemplate(id);
    }
    
    @RequestMapping(method = RequestMethod.POST, value = "/template")
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public @ResponseBody
    EntityTemplate createTemplate(@RequestBody EntityTemplate template)
    {
        return dataAccessService.createEntityTemplate(template);
    }
    
    @RequestMapping(method = RequestMethod.DELETE, value = "/template")
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public @ResponseBody
    String deleteTemplate(@RequestBody EntityTemplate template)
    {
        dataAccessService.deleteEntityTemplate(template);
        
        return "OK";
    }
    
    @RequestMapping(method = RequestMethod.PUT, value = "/template")
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public @ResponseBody
    EntityTemplate updateTemplate(@RequestBody EntityTemplate template)
    {
        return dataAccessService.updateEntityTemplate(template);
    }

    @RequestMapping(method = RequestMethod.GET, value = "/templates")
    @Transactional(propagation = Propagation.REQUIRES_NEW, readOnly = true)
    public @ResponseBody
    Set<EntityTemplate> getTemplates()
    {
        return dataAccessService.getEntityTemplates();
    }
}