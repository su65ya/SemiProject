<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/nav.jsp"></jsp:include>
<%
	String go = request.getParameter("go");
%>
<div align="center">
	<h2>관리자 비밀번호 확인</h2>
	
	<form action="admin_check.do" method="post">

		<input type="hidden" name="go" value="<%=go %>">
		<input type="password" name="admin_pw" required>
		<input type="submit" value="확인">
	
	</form>
	
	<%if(request.getParameter("error") != null) {%>
		<h6>비밀번호가 일치하지 않습니다</h6>
	<%} %>
</div>
<jsp:include page="/template/footer.jsp"></jsp:include>