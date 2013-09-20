package org.unido.eetdb.controller;

import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.unido.eetdb.common.model.Topic;
import org.unido.eetdb.service.DataAccessService;

@Controller
@Repository
public class TopicController
{
    private DataAccessService dataAccessService;

    @Autowired
    public void setDataAccessService(DataAccessService dataAccessService)
    {
        this.dataAccessService = dataAccessService;
    }

    @RequestMapping(method = RequestMethod.GET, value = "/topic/{id}")
    @Transactional(propagation = Propagation.REQUIRES_NEW, readOnly = true)
    public @ResponseBody
    Topic getTopic(@PathVariable("id") Long id)
    {
        return dataAccessService.getTopic(id);
    }
    
    @RequestMapping(method = RequestMethod.GET, value = "/topics")
    @Transactional(propagation = Propagation.REQUIRES_NEW, readOnly = true)
    public @ResponseBody
    Set<Topic> getRootTopics()
    {
        return dataAccessService.getRootTopics();
    }
    
    @RequestMapping(method = RequestMethod.POST, value = "/topic")
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public @ResponseBody
    Topic createTopic(@RequestBody Topic topic)
    {
        return dataAccessService.createTopic(topic);
    }
    
    @RequestMapping(method = RequestMethod.DELETE, value = "/topic")
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public @ResponseBody
    String deleteTopic(@RequestBody Topic topic)
    {
        dataAccessService.deleteTopic(topic);
        
        return "OK";
    }
    
    @RequestMapping(method = RequestMethod.PUT, value = "/topic")
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public @ResponseBody
    Topic updateTopic(@RequestBody Topic topic)
    {
        return dataAccessService.updateTopic(topic);
    }
}
