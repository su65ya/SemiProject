package semi.util;

import java.text.DecimalFormat;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import semi.beans.dto.RoomDto;

/**
 * 날짜를 검사하여 원하는 처리를 수행하는 클래스
 * 필요한 기능
 * 1. 날짜를 이용해서 주말인지 주중인지 판정하는 기능(2개)
 * 2. 날짜를 성수기인지 비수기인지 판정하는 기능(2개)
 * @author 강사
 */
public class DateChecker {
	
	
	public static boolean isOnSeason(Calendar c) {
		int month = c.get(Calendar.MONTH) + 1;
		return month >= 7 && month <= 8;
	}
	public static boolean isWeekend(Calendar c) {
		int week = c.get(Calendar.DAY_OF_WEEK);
		return week == Calendar.FRIDAY || week == Calendar.SATURDAY;
	}
	public static boolean isOffWeekday(Calendar c) {
		return !isOnSeason(c) && !isWeekend(c);
	}
	public static boolean isOffWeekend(Calendar c) {
		return !isOnSeason(c) && isWeekend(c);
	}
	public static boolean isOnWeekday(Calendar c) {
		return isOnSeason(c) && !isWeekend(c);
	}
	public static boolean isOnWeekend(Calendar c) {
		return isOnSeason(c) && isWeekend(c);
	}
	public static int calculatePrice(Calendar c, RoomDto rdto) {
//		System.out.println(new SimpleDateFormast("yyyy-MM-dd").format(c.getTime()));
		if(isOnWeekday(c)) {//성수기 평일
			return rdto.getOn_weekday();
		}
		else if(isOnWeekend(c)) {//성수기 주말
			return rdto.getOn_weekend();
		}
		else if(isOffWeekday(c)) {//비수기 평일
			return rdto.getOff_weekday();
		}
		else {
			return rdto.getOff_weekend();
		}
	}
	public static String calculatePriceWithFormat(Calendar c, RoomDto rdto) {
		int price = calculatePrice(c, rdto);
		Format f = new DecimalFormat("#,###");
		return f.format(price);
	}
	public static int day(Calendar c) {
		int month = c.get(Calendar.MONTH) + 1;
		int day = c.get(Calendar.DATE);
		return day;
	}
	public static int month(Calendar c) {
		int month = c.get(Calendar.MONTH) + 1;
		return month;
	}
	public static int year(Calendar c) {
		int year = c.get(Calendar.YEAR);
		return year;
	}
	
	public static String cal(int totalPrice) {
		Format f = new DecimalFormat("#,###");
		int calPrice = totalPrice;
		return f.format(calPrice);
		
	}
}
