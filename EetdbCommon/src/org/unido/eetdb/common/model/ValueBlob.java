package org.unido.eetdb.common.model;

import java.sql.Blob;

import com.fasterxml.jackson.annotation.JsonIgnore;

public class ValueBlob extends GenericObject
{
    private String mimeType;
    private String name;
    private Blob   content;

    public String getMimeType()
    {
        return mimeType;
    }

    public void setMimeType(String mimeType)
    {
        this.mimeType = mimeType;
    }

    @JsonIgnore
    public Blob getContent()
    {
        return content;
    }

    public void setContent(Blob content)
    {
        this.content = content;
    }

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }
}