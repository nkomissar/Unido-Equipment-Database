package org.unido.eetdb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
}