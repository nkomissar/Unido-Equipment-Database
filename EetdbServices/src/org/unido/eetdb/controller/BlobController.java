package org.unido.eetdb.controller;

import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.unido.eetdb.common.model.ValueBlob;
import org.unido.eetdb.service.DataAccessService;

import com.fasterxml.jackson.core.JsonFactory;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@Repository
public class BlobController
{
    private DataAccessService dataAccessService;

    @Autowired
    public void setDataAccessService(DataAccessService dataAccessService)
    {
        this.dataAccessService = dataAccessService;
    }
    
    @RequestMapping(method = RequestMethod.GET, value = "/blob/{id}")
    @Transactional(propagation = Propagation.REQUIRES_NEW, readOnly = true)
    public @ResponseBody
    String getValueBlob(@PathVariable Long id, HttpServletResponse response)
    {
        ValueBlob retVal = dataAccessService.getValueBlob(id);
        ObjectMapper jsonMapper = new ObjectMapper();
        OutputStream out = null;
        
        try
        {
            response.setHeader("json-blob-data", jsonMapper.writeValueAsString(retVal));
            response.setContentType(retVal.getMimeType());

            out = response.getOutputStream();

            IOUtils.copy(retVal.getContent().getBinaryStream(), out);
        }
        catch(Exception ex)
        {}
        finally
        {
            if(out != null)
            {
                try
                {
                    out.flush();
                    out.close();
                }
                catch (IOException e)
                {}
            }
        }
        
        return null;
    }
}
