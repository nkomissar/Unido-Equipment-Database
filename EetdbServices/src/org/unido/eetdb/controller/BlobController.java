package org.unido.eetdb.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.util.Set;

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
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.unido.eetdb.common.model.ValueBlob;
import org.unido.eetdb.service.DataAccessService;

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
    String getValueBlob(@PathVariable("id") Long id, HttpServletResponse response)
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
    
    @RequestMapping(method = RequestMethod.POST, value = "/blob")
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public @ResponseBody
    ValueBlob saveValueBlob(@RequestPart("json-blob-data") ValueBlob valueBlob, @RequestPart("file-data") MultipartFile blobData) throws IOException
    {
        return dataAccessService.saveValueBlob(valueBlob, blobData.getBytes());
    }
    
    @RequestMapping(method = RequestMethod.GET, value = "/blob-meta/{id}")
    @Transactional(propagation = Propagation.REQUIRES_NEW, readOnly = true)
    public @ResponseBody
    ValueBlob getValueBlobMeta(@PathVariable("id") Long id, HttpServletResponse response)
    {
        return dataAccessService.getValueBlob(id);
    }

    @RequestMapping(method = RequestMethod.GET, value = "/entity/{id}/blob-meta")
    @Transactional(propagation = Propagation.REQUIRES_NEW, readOnly = true)
    public @ResponseBody
    Set<ValueBlob> getValueBlobMetaForEntity(@PathVariable("id") Long id, HttpServletResponse response)
    {
        return dataAccessService.getValueBlobMetaForEntity(id);
    }

}
