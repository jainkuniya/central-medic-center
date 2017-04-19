package utils;

import java.util.Calendar;
import java.util.Date;
import java.text.SimpleDateFormat;

public class DateUtils    {
	
	static SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
	
	public static long getLongFromDate(String stringDate){
		try {
		    Date d = (Date) simpleDateFormat.parse(stringDate);
		    return  d.getTime();
		} catch (Exception e) {
			e.printStackTrace();
		    return 0;
		}
	}
	
	public static String getStringFromDate(long longDate){
        Date date=new Date(longDate);
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        return simpleDateFormat.format(date);
	}
	
	public static String getDateTtimeSringFromDate(long longDate){
        Date date=new Date(longDate);
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd, hh:mm:aa");
        return simpleDateFormat.format(date);
	}
	
	public static int getYearsFromLong(long longDate){
		Date date = new Date(longDate); 
	    Calendar cal = Calendar.getInstance();
	    Calendar currentCal = Calendar.getInstance();
	    cal.setTime(date);
	    return currentCal.get(Calendar.YEAR) - cal.get(Calendar.YEAR);
	}
}
