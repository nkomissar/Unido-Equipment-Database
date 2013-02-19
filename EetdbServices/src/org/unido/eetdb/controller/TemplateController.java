package org.unido.eetdb.controller;

import java.util.ArrayList;

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
    public void setEntityService(DataAccessService dataAccessService)
    {
        this.dataAccessService = dataAccessService;
    }

    @RequestMapping(method = RequestMethod.GET, value = "/template/{id}")
    public @ResponseBody
    EntityTemplate getTemplate(@PathVariable Long id)
    {
        EntityTemplate template = dataAccessService.getEntityTemplate(id);

        return template;
    }

    @RequestMapping(method = RequestMethod.GET, value = "/templates")
    public @ResponseBody
    ArrayList<EntityTemplate> getTemplates()
    {
        return dataAccessService.getEntityTemplates();
    }
}
