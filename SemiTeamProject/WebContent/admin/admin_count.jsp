<%@page import="semi.beans.dto.MonthlyCountSellerDto"%>
<%@page import="semi.beans.dto.MonthlyCountMemberDto"%>
<%@page import="semi.beans.dto.DailyCountSellerDto"%>
<%@page import="semi.beans.dao.CountSellerDao"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.dto.DailyCountMemberDto"%>
<%@page import="semi.beans.dao.CountMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	CountMemberDao cmdao = new CountMemberDao();
	List<DailyCountMemberDto> list_dailyMemberCount = cmdao.getList_DCM();
	List<MonthlyCountMemberDto> list_montlyMemberCount = cmdao.getList_MCM();
	
	CountSellerDao csdao = new CountSellerDao();
	List<DailyCountSellerDto> list_dailySellerCount = csdao.getList_DCS();
	List<MonthlyCountSellerDto> list_monthlySellerCount = csdao.getList_MCS();
%>
<jsp:include page="/template/nav.jsp"></jsp:include>

<div align="center">
	<h2>일별 회원 가입자 현황</h2>
	
	<%
		for(DailyCountMemberDto dcdto : list_dailyMemberCount) {
	%>
		<h5>-<%=dcdto.getDay()%> : <%=dcdto.getCnt() %>명</h5>
	<%} %>
	
	<h2>월별 회원 가입자 현황</h2>
	
	<%
		for(MonthlyCountMemberDto mcdto : list_montlyMemberCount) {
	%>
		<h5>-<%=mcdto.getDay()%> : <%=mcdto.getCnt() %>명</h5>
	<%} %>
	
	
	
	<hr>
	<h2>일별 판매자 가입자 현황</h2>
	
	<%
		for(DailyCountSellerDto dcdto : list_dailySellerCount) {
	%>
		<h5>-<%=dcdto.getDay()%> : <%=dcdto.getCnt() %>명</h5>
	<%} %>
	
	<h2>월별 판매자 가입자 현황</h2>
	
	<%
		for(MonthlyCountSellerDto mcdto : list_monthlySellerCount) {
	%>
		<h5>-<%=mcdto.getDay()%> : <%=mcdto.getCnt() %>명</h5>
	<%} %>
	

</div>

<jsp:include page="/template/footer.jsp"></jsp:include>