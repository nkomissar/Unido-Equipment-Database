package org.unido.eetdb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.unido.eetdb.common.model.EntityTemplate;
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

    @RequestMapping(method = RequestMethod.GET, value = "/template/{id}")
    public @ResponseBody
    EntityTemplate getTemplate(@PathVariable Long id)
    {
        return dataAccessService.getEntityTemplate(id);
    }
    
    @RequestMapping(method = RequestMethod.POST, value = "/template")
    public @ResponseBody
    EntityTemplate createTemplate(@PathVariable EntityTemplate template)
    {
        return dataAccessService.createEntityTemplate(template);
    }

    @RequestMapping(method = RequestMethod.GET, value = "/templates")
    public @ResponseBody
    List<EntityTemplate> getTemplates()
    {
        return dataAccessService.getEntityTemplates();
    }
}