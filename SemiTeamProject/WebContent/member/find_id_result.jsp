<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
	String member_name = (String)session.getAttribute("member_name");
	session.removeAttribute("member_name");
%>
        
    
    <%
	String member_id = (String)session.getAttribute("member_id");
	session.removeAttribute("member_id");
%>
    
    
<jsp:include page = "/template/nav.jsp"></jsp:include>
<div align= "center">

	<h3><%=member_name %>님의 아이디는 <%=member_id%> 입니다</h3>
	
	
	<h5><a href="login.jsp">로그인 하러가기</a></h5>
	<h5><a href="find_pw.jsp">비밀번호 찾기</a></h5>


</div>



<jsp:include page= "/template/footer.jsp"></jsp:include>