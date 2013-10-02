package org.unido.eetdb.util;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import org.springframework.http.client.ClientHttpResponse;
import org.springframework.web.client.ResponseExtractor;

import org.apache.commons.io.IOUtils;

public class BlobResponseExtractor implements ResponseExtractor<Object>
{

    private final OutputStream outputStream;
    private       OutputStream OutputStream() { return this.outputStream; }
 
    public BlobResponseExtractor ( OutputStream outputStream )
    {
        this.outputStream = outputStream;
    }
    
	@Override
	public Object extractData(ClientHttpResponse response) throws IOException 
	{
        InputStream  is = response.getBody();
        OutputStream os = OutputStream();
 
        IOUtils.copyLarge( is, os );
        IOUtils.closeQuietly( is );
        IOUtils.closeQuietly( os );
 
        return null;
	}

}
