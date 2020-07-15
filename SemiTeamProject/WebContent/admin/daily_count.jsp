<%@page import="semi.beans.dto.DailyCountSellerDto"%>
<%@page import="semi.beans.dao.DailyCountSellerDao"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.dto.DailyCountMemberDto"%>
<%@page import="semi.beans.dao.DailyCountMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	DailyCountMemberDao dcmdao = new DailyCountMemberDao();
	List<DailyCountMemberDto> listM = dcmdao.getList();
	List<DailyCountMemberDto> list = dcmdao.getList();
	
	DailyCountSellerDao dcsdao = new DailyCountSellerDao();
	List<DailyCountSellerDto> listS = dcsdao.getList();
%>
<jsp:include page="/template/nav.jsp"></jsp:include>

<div align="center">
	<h2>일별 회원 가입자 현황</h2>
	
	<%
		for(DailyCountMemberDto dcdto : listM) {
	%>
		<h5>-<%=dcdto.getDay()%> : <%=dcdto.getCnt() %>명</h5>
	<%} %>
	
	<h2>일별 판매자 가입자 현황</h2>
	
	<%
		for(DailyCountSellerDto dcdto : listS) {
	%>
		<h5>-<%=dcdto.getDay()%> : <%=dcdto.getCnt() %>명</h5>
	<%} %>
	

</div>

<jsp:include page="/template/footer.jsp"></jsp:include>