package org.unido.eetdb.daemon;

import java.io.File;
import java.util.Timer;
import java.util.TimerTask;

import org.apache.log4j.Logger;
import org.unido.eetdb.servicehost.Service;
import org.unido.eetdb.servicehost.ServiceStatus;

public class FileSystemDaemon extends Service
{
    private static final Logger logger    = Logger.getLogger(FileSystemDaemon.class);

    private String              pathToMonitor;
    private String              pathToStorage;
    private Timer               refreshTimer;
    private volatile boolean    stillBusy = false;

    private void checkFolderToMonitor()
    {
        File dataFolder = null;
        File storageFolder = null;

        try
        {
            dataFolder = new File(pathToMonitor);
            storageFolder = new File(pathToStorage);

            for (File file : dataFolder.listFiles())
            {
                logger.info(String.format("Started processing data file: %s", file.getName()));
                
                if (!file.getName().endsWith(".csv"))
                {
                    logger.info(String.format("Unsupported file format, deleting..."));

                    file.delete();
                }
            }
        }
        catch (Throwable ex)
        {
            logger.error(ex.getMessage() + ex.getStackTrace());
        }
    }

    @Override
    public boolean start()
    {
        logger.debug("Starting FileSystemDaemon...");

        setStatus(ServiceStatus.Starting);

        if (pathToMonitor == null)
        {
            logger.error("Property pathToMonitor is not set.");
            setStatus(ServiceStatus.Broken);
            return false;
        }

        if (pathToStorage == null)
        {
            logger.error("Property pathToStorage is not set.");
            setStatus(ServiceStatus.Broken);
            return false;
        }

        refreshTimer = new Timer();
        refreshTimer.schedule(new TimerTask()
        {
            @Override
            public void run()
            {
                if (!stillBusy)
                {
                    checkFolderToMonitor();
                }
            }
        }, 0, 5000);

        setStatus(ServiceStatus.Running);

        return true;
    }

    @Override
    public void stop()
    {
        logger.info("Stopping FileSystemDaemon...");

        setStatus(ServiceStatus.Stopping);

        if (refreshTimer != null)
            refreshTimer.cancel();

        refreshTimer = null;

        setStatus(ServiceStatus.Stopped);
    }

    public String getPathToMonitor()
    {
        return pathToMonitor;
    }

    public void setPathToMonitor(String pathToMonitor)
    {
        this.pathToMonitor = pathToMonitor;
    }

    public String getPathToStorage()
    {
        return pathToStorage;
    }

    public void setPathToStorage(String pathToStorage)
    {
        this.pathToStorage = pathToStorage;
    }
}
