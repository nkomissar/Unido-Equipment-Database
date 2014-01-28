package org.unido.eetdb.controller;

import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.unido.eetdb.common.model.UploadError;
import org.unido.eetdb.common.model.UploadItem;
import org.unido.eetdb.service.DataAccessService;

@Controller
@Repository
public class UploadItemController 
{
    private DataAccessService dataAccessService;

    @Autowired
    public void setDataAccessService(DataAccessService dataAccessService)
    {
        this.dataAccessService = dataAccessService;
    }
    
    @RequestMapping(method = RequestMethod.GET, value = "/uploadItems/{id}")
    @Transactional(propagation = Propagation.REQUIRES_NEW, readOnly = true)
    public @ResponseBody
    UploadItem getUploadItem(@PathVariable("id") Long id)
    {
        return dataAccessService.getUploadItem(id);
    }
    
    @RequestMapping(method = RequestMethod.GET, value = "/uploadItems")
    @Transactional(propagation = Propagation.REQUIRES_NEW, readOnly = true)
    public @ResponseBody
    Set<UploadItem> getUploadItems()
    {
        return dataAccessService.getUploadItems();
    }

    @RequestMapping(method = RequestMethod.GET, value = "/uploadItems/{id}/uploadErrors")
    @Transactional(propagation = Propagation.REQUIRES_NEW, readOnly = true)
    public @ResponseBody
    Set<UploadError> getUploadErrors(@PathVariable("id") Long id)
    {
    	Set<UploadError> result = dataAccessService.getUploadErrors(id);
        return result;
    }
    
}
