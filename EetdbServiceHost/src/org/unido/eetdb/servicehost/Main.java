package org.unido.eetdb.servicehost;

import org.apache.log4j.Logger;
import org.apache.log4j.xml.DOMConfigurator;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

abstract class Main
{
    private static final Logger logger = Logger.getLogger(Main.class);

    private Main()
    {
    }

    public static void main(String[] args)
    {
        if (args.length != 2)
        {
            System.err.println("Not all arguments specified.");
            return;
        }

        Runnable serviceHost;

        try
        {
            DOMConfigurator.configure(args[1]);
            ApplicationContext context = new FileSystemXmlApplicationContext(args[0]);

            serviceHost = context.getBean("serviceHost", Runnable.class);
        }
        catch (Throwable t)
        {
            System.err.println("Failed to start service host.");
            t.printStackTrace();
            logger.fatal("Failed to start service host.", t);

            return;
        }

        serviceHost.run();
    }
}