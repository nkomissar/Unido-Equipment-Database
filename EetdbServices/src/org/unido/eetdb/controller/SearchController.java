package org.unido.eetdb.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.jasper.util.Enumerator;
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
import org.unido.eetdb.common.model.Entity;
import org.unido.eetdb.common.model.EntitySearchResult;
import org.unido.eetdb.common.model.Topic;
import org.unido.eetdb.service.DataAccessService;

@Controller
@Repository
public class SearchController
{
    private static final Logger logger = Logger.getLogger(SearchController.class);

    private DataAccessService   dataAccessService;

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

    @RequestMapping(method = RequestMethod.GET, value = "/search")
    @Transactional(propagation = Propagation.REQUIRES_NEW, readOnly = true)
    public @ResponseBody
    List<Entity> searchForEntities(HttpServletRequest httpRequest)
    {
        StringBuilder builder = new StringBuilder();
        Map<String, ParamElement> params = new HashMap<String, ParamElement>();
        Enumeration<String> enumeration = httpRequest.getParameterNames(); 

        while (enumeration.hasMoreElements())
        {
            String paramName = enumeration.nextElement();
            String propertyCode = paramName.replace("min", "").replace("max", "");
            ParamElement element = null;
            
            if(!(paramName.equalsIgnoreCase("templateCode") || paramName.equalsIgnoreCase("templateId")))
            {
                if(params.containsKey(propertyCode))
                {
                    element = params.get(propertyCode);                    
                }
                else
                {
                    element = new ParamElement();

                    params.put(propertyCode, element);
                }
                
                if(paramName.contains("min"))
                {
                    element.setMin(httpRequest.getParameter(paramName));
                }
                
                if(paramName.contains("max"))
                {
                    element.setMax(httpRequest.getParameter(paramName));
                }
                
                element.setCode(propertyCode);
                element.setValue(httpRequest.getParameter(propertyCode));
            }
        }

        builder.append("<properties>");
        
        for(ParamElement param : params.values())
        {
            builder.append(param);
        }
        
        builder.append("</properties>");

        return dataAccessService.searchForEntities(httpRequest.getParameter("templateCode"), builder.toString());
    }
    
    private class ParamElement
    {
        private String min;
        private String max;
        private String code;
        private String value;

        public String getMin()
        {
            return min;
        }
        public void setMin(String min)
        {
            this.min = min;
        }
        public String getMax()
        {
            return max;
        }
        public void setMax(String max)
        {
            this.max = max;
        }
        public String getCode()
        {
            return code;
        }
        public void setCode(String code)
        {
            this.code = code;
        }
        public String getValue()
        {
            return value;
        }
        public void setValue(String value)
        {
            this.value = value;
        }
        
        public String toString()
        {
            StringBuilder builder = new StringBuilder();
            
            builder.append("<property>");

            builder.append("<code>");
                builder.append(getCode());
            builder.append("</code>");
            
            if(getValue() != null)
            {
                builder.append("<value>");
                    builder.append(getValue());
                builder.append("</value>");
            }
            else
            {
                builder.append("<value/>");
            }
            
            if(getMin() != null)
            {
                builder.append("<min>");
                    builder.append(getMin());
                builder.append("</min>");
            }
            else
            {
                builder.append("<min/>");
            }
            
            if(getMax() != null)
            {
                builder.append("<max>");
                    builder.append(getMax());
                builder.append("</max>");
            }
            else
            {
                builder.append("<max/>");
            }
                
            builder.append("</property>");
            
            return builder.toString();
        }
    }
}
