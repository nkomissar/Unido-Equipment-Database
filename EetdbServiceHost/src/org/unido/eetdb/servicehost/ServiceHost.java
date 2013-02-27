package org.unido.eetdb.servicehost;

import java.util.Collection;

import org.apache.log4j.Logger;

final class ServiceHost implements Runnable
{
    private static final Logger logger = Logger.getLogger(ServiceHost.class);

    private Collection<Service> services;
    private volatile boolean    stop;
    private volatile boolean    stopped;

    public ServiceHost()
    {
        stop = false;
        stopped = false;
        services = null;
    }

    @Override
    public void run()
    {
        if (!start())
        {
            return;
        }

        while (!stop)
        {
            try
            {
                Thread.sleep(100);
            }
            catch (InterruptedException e)
            {
                logger.warn("Main service host thread interrupted.", e);
            }
        }

        stop();

        stopped = true;
    }

    private void shutdown()
    {
        logger.info("Shutting down service host.");

        stop = true;

        while (!stopped)
        {
            try
            {
                Thread.sleep(100);
            }
            catch (InterruptedException e)
            {
                logger.warn("Shutdown thread interrupted.", e);
            }
        }
    }

    /**
     * Starts all registered services.
     * 
     * @return true if the service host has started successfully.
     */
    private boolean start()
    {
        logger.debug("Starting service host.");

        try
        {
            if (services != null)
            {

                int svcId = 1;

                for (Service svc : services)
                {
                    try
                    {
                        svc.setId(svcId);
                        svc.start();
                    }
                    catch (Throwable t)
                    {
                        logger.error(String.format("Failed to start the service %d.", svcId), t);
                    }

                    ++svcId;
                }
            }

            Runtime.getRuntime().addShutdownHook(new Thread(new Runnable()
            {
                @Override
                public void run()
                {
                    shutdown();
                }
            }));
        }
        catch (Throwable t)
        {
            logger.fatal("Failed to start service host.", t);
            return false;
        }

        logger.debug("Service host started.");

        return true;
    }

    /**
     * Stops all running services.
     */
    private void stop()
    {
        logger.debug("Stopping service host.");

        try
        {
            if (services != null)
            {
                for (Service svc : services)
                {
                    try
                    {
                        if (svc.getStatus().equals(ServiceStatus.Running))
                        {
                            svc.stop();
                        }
                    }
                    catch (Throwable t)
                    {
                        logger.error(String.format("Failed to stop the service %d.", svc.getId()), t);
                    }
                }
            }
        }
        catch (Throwable t)
        {
            logger.fatal("Failed to stop service host.", t);
            return;
        }

        logger.debug("Service host stopped.");
    }

    public Collection<Service> getServices()
    {
        return services;
    }

    public void setServices(Collection<Service> services)
    {
        this.services = services;
    }
}