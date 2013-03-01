package org.unido.eetdb.daemon;

import java.io.File;
import java.util.HashSet;
import java.util.Timer;
import java.util.TimerTask;

import org.apache.log4j.Logger;
import org.unido.eetdb.servicehost.Service;
import org.unido.eetdb.servicehost.ServiceStatus;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;

public class FileSystemDaemon extends Service
{
    private static final Logger logger           = Logger.getLogger(FileSystemDaemon.class);

    private String              pathToMonitor;
    private String              pathToStore;
    private Timer               refreshTimer;
    private HashSet<String>     supportedFormats = new HashSet<String>();

    private void checkFolderToMonitor()
    {
        File dataFolder = null;
        File storageFolder = null;
        File garbageFolder = null;

        try
        {
            dataFolder = new File(pathToMonitor);
            storageFolder = new File(pathToStore);
            garbageFolder = new File(storageFolder.getPath() + "/Garbage");

            for (File file : dataFolder.listFiles())
            {
                logger.info(String.format("Started processing data file: %s", file.getName()));

                try
                {
                    if (!supportedFormats.contains(FilenameUtils.getExtension(file.getName())))
                    {
                        logger.info(String.format("Unsupported file format, deleting..."));

                        file.delete();
                    }
                    else
                    {
                        FileUtils.moveFileToDirectory(file, storageFolder, false);
                    }
                }
                catch (Throwable ex)
                {
                    logger.error(String.format("Failed to process the file: %s with error: %s",
                            file.getName(), ex));

                    FileUtils.moveFileToDirectory(file, garbageFolder, true);
                }
            }
        }
        catch (Throwable ex)
        {
            logger.error(String.format("Fatal error accessing source folder: %s", ex));
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

        if (pathToStore == null)
        {
            logger.error("Property pathToStore is not set.");
            setStatus(ServiceStatus.Broken);
            return false;
        }

        refreshTimer = new Timer();
        refreshTimer.schedule(new TimerTask()
        {
            @Override
            public void run()
            {
                checkFolderToMonitor();
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
        return pathToStore;
    }

    public void setPathToStorage(String pathToStorage)
    {
        this.pathToStore = pathToStorage;
    }
}
