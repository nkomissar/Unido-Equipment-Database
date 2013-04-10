package org.unido.eetdb.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.unido.eetdb.common.model.EntitySearchResult;
import org.unido.eetdb.common.model.Topic;
import org.unido.eetdb.service.DataAccessService;

@Controller
@Repository
public class SearchController
{
    private static final Logger logger = Logger.getLogger(SearchController.class);

    private DataAccessService dataAccessService;

    @Autowired
    public void setDataAccessService(DataAccessService dataAccessService)
    {
        this.dataAccessService = dataAccessService;
    }

    @RequestMapping(method = RequestMethod.GET, value = "/search-for-topics")
    @Transactional(propagation = Propagation.REQUIRES_NEW, readOnly = true)
    public @ResponseBody
    List<Topic> searchForTopics(@RequestParam("param") String param)
    {
        return dataAccessService.searchForTopics(param);
    }
    
    @RequestMapping(method = RequestMethod.GET, value = "/search-for-entities")
    @Transactional(propagation = Propagation.REQUIRES_NEW, readOnly = true)
    public @ResponseBody
    List<EntitySearchResult> searchForEntities(@RequestParam("param") String param)
    {
        logger.debug(String.format("Incoming request: %s", param));

        return dataAccessService.searchForEntities(param);
    }
}