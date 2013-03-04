package org.unido.eetdb.daemon;

import java.util.Timer;
import java.util.TimerTask;

import org.apache.log4j.Logger;
import org.unido.eetdb.servicehost.Service;
import org.unido.eetdb.servicehost.ServiceStatus;

public class SmtpDaemon extends Service
{
    private static final Logger logger = Logger.getLogger(SmtpDaemon.class);

    private String              pathToMonitor;
    private Timer               refreshTimer;

    private void checkForMail()
    {
        
    }

    @Override
    public boolean start()
    {
        logger.debug("Starting SmtpDaemon...");

        setStatus(ServiceStatus.Starting);

        if (pathToMonitor == null)
        {
            logger.error("Property pathToMonitor is not set.");
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

}
