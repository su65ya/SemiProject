package com.kh.semi;

import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Date;


public class Test {
	public static void main(String[] args) {
		
		String date = "2012년 7월 11일 (수)";
		
		SimpleDateFormat original_format = new SimpleDateFormat("yyyy년 M월 d일 (E)");	
		SimpleDateFormat new_format = new SimpleDateFormat("yyyy-MM-dd");
		
	try {
		Date original_date = original_format.parse(date);
		String new_date = new_format.format(original_date);
		System.out.println(new_date);
	}
	catch (Exception e) {
		e.printStackTrace();
	}
	}
}
