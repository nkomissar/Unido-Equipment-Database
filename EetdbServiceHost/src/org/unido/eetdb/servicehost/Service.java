package org.unido.eetdb.servicehost;

public abstract class Service
{
    private int           id;
    private ServiceStatus status;

    public int getId()
    {
        return id;
    }

    public void setId(int id)
    {
        this.id = id;
    }

    public ServiceStatus getStatus()
    {
        return status;
    }

    protected void setStatus(ServiceStatus status)
    {
        this.status = status;
    }

    /**
     * When implemented must start the internal threads and/or timers of the
     * service.
     * 
     * @return true if the service has been started successfully. If the service
     *         returned false, it must set its status Broken.
     */
    public abstract boolean start();

    /**
     * When implemented must gracefully stop the service. After call to stop()
     * the service is assumed to have the status Stopped.
     */
    public abstract void stop();
}