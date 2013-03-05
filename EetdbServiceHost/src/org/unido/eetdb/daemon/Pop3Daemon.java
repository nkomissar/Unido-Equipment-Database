package org.unido.eetdb.daemon;

import java.io.File;
import java.util.Properties;
import java.util.Timer;
import java.util.TimerTask;

import javax.mail.Flags;
import javax.mail.Folder;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Part;
import javax.mail.Session;
import javax.mail.Store;
import javax.mail.internet.MimeBodyPart;

import org.apache.log4j.Logger;
import org.unido.eetdb.servicehost.Service;
import org.unido.eetdb.servicehost.ServiceStatus;

public class Pop3Daemon extends Service
{
    private static final Logger logger = Logger.getLogger(Pop3Daemon.class);

    private String              pathToStorage;
    private String              pop3Host;
    private int                 port   = 110;
    private String              uid;
    private String              pwd;
    private Timer               refreshTimer;

    private void checkForMail()
    {
        Properties properties = new Properties();

        // server settings
        properties.put("mail.pop3.host", pop3Host);
        properties.put("mail.pop3.port", port);

        Session session = Session.getDefaultInstance(properties);

        Store store = null;
        Folder inbox = null;

        try
        {
            store = session.getStore("pop3");
            store.connect(uid, pwd);

            logger.info(String.format("Connected to POP3 server: %s", pop3Host));

            inbox = store.getFolder("INBOX");
            inbox.open(Folder.READ_WRITE);

            Message[] arrayMessages = inbox.getMessages();

            for (Message message : arrayMessages)
            {
                if (message.getContentType().contains("multipart"))
                {
                    Multipart multiPart = (Multipart) message.getContent();

                    for (int partCount = 0; partCount < multiPart.getCount(); partCount++)
                    {
                        MimeBodyPart part = (MimeBodyPart) multiPart.getBodyPart(partCount);

                        if (Part.ATTACHMENT.equalsIgnoreCase(part.getDisposition()))
                        {
                            logger.info(String.format("Attachment found: %s", part.getFileName()));

                            part.saveFile(new File(pathToStorage, part.getFileName()));

                            logger.info(String.format("Attachment saved: %s\\%s", pathToStorage,
                                    part.getFileName()));
                        }
                    }
                }

                message.setFlag(Flags.Flag.DELETED, true);
            }
        }
        catch (Throwable t)
        {
            logger.error(String.format("Faield to check mail"), t);
        }
        finally
        {
            if (inbox != null)
            {
                try
                {
                    inbox.expunge();
                    inbox.close(false);
                }
                catch (MessagingException e)
                {
                }
            }

            if (store != null)
            {
                try
                {
                    store.close();
                }
                catch (MessagingException e)
                {
                }
            }
        }
    }

    @Override
    public boolean start()
    {
        logger.debug("Starting SmtpDaemon...");

        setStatus(ServiceStatus.Starting);

        if (pathToStorage == null)
        {
            logger.error("Property pathToStorage is not set.");
            setStatus(ServiceStatus.Broken);
            return false;
        }

        if (pop3Host == null)
        {
            logger.error("Property pop3Host is not set.");
            setStatus(ServiceStatus.Broken);
            return false;
        }

        if (uid == null)
        {
            logger.error("Property uid is not set.");
            setStatus(ServiceStatus.Broken);
            return false;
        }

        if (pwd == null)
        {
            logger.error("Property pwd is not set.");
            setStatus(ServiceStatus.Broken);
            return false;
        }

        refreshTimer = new Timer();
        refreshTimer.schedule(new TimerTask()
        {
            @Override
            public void run()
            {
                checkForMail();
            }
        }, 0, 5000);

        setStatus(ServiceStatus.Running);

        return true;
    }

    @Override
    public void stop()
    {
        logger.info("Stopping SmtpDaemon...");

        setStatus(ServiceStatus.Stopping);

        if (refreshTimer != null)
            refreshTimer.cancel();

        refreshTimer = null;

        setStatus(ServiceStatus.Stopped);
    }

    public String getPathToStorage()
    {
        return pathToStorage;
    }

    public void setPathToStorage(String pathToStorage)
    {
        this.pathToStorage = pathToStorage;
    }

    public String getPop3Host()
    {
        return pop3Host;
    }

    public void setPop3Host(String pop3Host)
    {
        this.pop3Host = pop3Host;
    }

    public String getUid()
    {
        return uid;
    }

    public void setUid(String uid)
    {
        this.uid = uid;
    }

    public String getPwd()
    {
        return pwd;
    }

    public void setPwd(String pwd)
    {
        this.pwd = pwd;
    }

    public int getPort()
    {
        return port;
    }

    public void setPort(int port)
    {
        this.port = port;
    }
}
