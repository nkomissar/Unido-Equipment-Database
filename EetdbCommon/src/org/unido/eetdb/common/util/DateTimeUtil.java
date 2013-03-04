package org.unido.eetdb.common.util;

import org.joda.time.DateTimeZone;

public class DateTimeUtil
{
    private static DateTimeZone localTimeZone = DateTimeZone.getDefault();

    public static long localToUTC(long localTime)
    {
        return localTimeZone.convertLocalToUTC(localTime, true);
    }
    
    public static long utcToLocal(long utcTime)
    {
        return localTimeZone.convertUTCToLocal(utcTime);
    }
}