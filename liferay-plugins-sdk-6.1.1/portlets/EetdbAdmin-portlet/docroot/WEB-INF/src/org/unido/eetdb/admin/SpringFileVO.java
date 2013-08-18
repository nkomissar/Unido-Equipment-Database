package org.unido.eetdb.admin;

import org.springframework.web.multipart.commons.CommonsMultipartFile;
 
public class SpringFileVO {
 
    private CommonsMultipartFile fileData;
    private String message;
 
    public String getMessage() {
        return message;
    }
 
    public void setMessage(String message) {
        this.message = message;
    }

    public CommonsMultipartFile getFileData() {
        return fileData;
    }
 
    public void setFileData(CommonsMultipartFile fileData) {
        this.fileData = fileData;
    }
     
}