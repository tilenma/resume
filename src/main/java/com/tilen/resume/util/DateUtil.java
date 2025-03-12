package com.tilen.resume.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Period;
import java.time.ZoneId;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

public class DateUtil {
	
	private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	private static SimpleDateFormat sdf2 = new SimpleDateFormat("MM-dd HH:mm"); //date only
	private static SimpleDateFormat sdf3 = new SimpleDateFormat("yyyy-MM-dd HH:mm (z)");
	private static SimpleDateFormat sdf4 = new SimpleDateFormat("yyyy:MM:dd:HH:mm:ss");
	private static SimpleDateFormat sdf5 = new SimpleDateFormat("yyyy-MM-dd");	
	
	private static TimeZone utc = TimeZone.getTimeZone("UTC");
	private static TimeZone hk = TimeZone.getTimeZone("Asia/Hong_Kong");
	private static TimeZone nz = TimeZone.getTimeZone("NZ");
	private static TimeZone mel = TimeZone.getTimeZone("Australia/Melbourne");
	
	public static int yearsBetween(Date date1, Date date2){
		//DateTime startDate = new DateTime(date1);
		//DateTime endDate = new DateTime(date2);
		
		//Years result = Years.yearsBetween(startDate, endDate);
		//return result.getYears();
		
		LocalDate startDate = date1.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
		LocalDate endDate = date2.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
		
		Period period = Period.between(startDate, endDate);
		
		return period.getYears();
	}
	
	public static int monthsBetween(Date date1, Date date2){
		/*DateTime startDate = new DateTime(date1);
		DateTime endDate = new DateTime(date2);
		
		Months result = Months.monthsBetween(startDate, endDate);
		
		return result.getMonths();*/
		LocalDate startDate = date1.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
		LocalDate endDate = date2.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
		
		Period period = Period.between(startDate, endDate);
		
		return period.getMonths();
	}
	
	public static int daysBetween(Date date1, Date date2){
		/*
		DateTime startDate = new DateTime(date1);
		DateTime endDate = new DateTime(date2);
		
		Days result = Days.daysBetween(startDate, endDate);
		
		return result.getDays();*/
		LocalDate startDate = date1.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
		LocalDate endDate = date2.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
		
		Period period = Period.between(startDate, endDate);
		
		return period.getDays();
	}
	
	public static Date parseDate(String aDateStr) throws ParseException{
		sdf5.setTimeZone(hk);
		return sdf5.parse(aDateStr);
	}
	
	public static String formatDate(Date aDate){
		sdf.setTimeZone(hk);
		return sdf.format(aDate);
	}
	
	public static String formatDate2(Date aDate){
		sdf2.setTimeZone(hk);
		return sdf2.format(aDate);
	}
	
	public static String formatDate3(Date aDate){
		sdf3.setTimeZone(hk);
		return sdf3.format(aDate);
	}
	
	public static String formatDate6(Date aDate){
		sdf3.setTimeZone(nz);
		return sdf3.format(aDate);
	}
	
	public static String formatMelbourneTime(Date aDate){
		sdf3.setTimeZone(mel);
		return sdf3.format(aDate);
	}
	
	public static String formatDate5(Date aDate){
		sdf5.setTimeZone(hk);
		return sdf5.format(aDate);
	}
	
	public static Date minusHour(Date aDate){
		Calendar cal = Calendar.getInstance();
		cal.setTimeZone(hk);
		
		cal.setTime(aDate);
		cal.add(Calendar.HOUR, -1);
		
		return cal.getTime();
	}
	
	public static String formatDate4(Date aDate){
		sdf4.setTimeZone(hk);
		return sdf4.format(aDate);
	}
}
