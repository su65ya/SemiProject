<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
	String member_id = (String)session.getAttribute("member_id");
	session.removeAttribute("member_id");
%>
    
    
<jsp:include page = "/template/nav.jsp"></jsp:include>


<article class='w-30'>
	
	<div class='row-empty'></div>
	<div class='row-empty'></div>
	
	<div class='row'>
		<h3>조회하신 아이디는 <%=member_id%> 입니다</h3>
	</div>
	
	<div class='row'>
		<h5><a href="login.jsp">로그인 하러가기</a></h5>
		<h5><a href="find_pw.jsp">비밀번호 찾기</a></h5>
	</div>]
	
	<div class='row-empty'></div>
	<div class='row-empty'></div>	


</article>





<jsp:include page= "/template/footer.jsp"></jsp:include>