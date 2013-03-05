package org.unido.eetdb.admin.util;

import java.net.URI;

import org.apache.http.client.methods.HttpEntityEnclosingRequestBase;


public class HttpEntityEnclosingDeleteRequest extends HttpEntityEnclosingRequestBase {
	 
    public HttpEntityEnclosingDeleteRequest(final URI uri) {
        super();
        setURI(uri);
    }
 
    @Override
    public String getMethod() {
        return "DELETE";
    }
}

