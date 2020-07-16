<%@page import="semi.beans.dao.ReservationDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
ReservationDao rdao = new ReservationDao();

long st = System.currentTimeMillis();
for(int i=1; i <=2; i++) {
	for(int day = 14; day <= 28; day++) {
		long startTime = System.currentTimeMillis();
		System.out.println(i+"-"+day+" : " + rdao.isReservation(i, "2020/07/"+day));
		long finishTime = System.currentTimeMillis();
		System.out.println("소요시간 : "+(finishTime - startTime) / 1000.0);
	}
}
long fin = System.currentTimeMillis();
System.out.println("총 소요시간 : "+(fin - st) / 1000.0);
%>