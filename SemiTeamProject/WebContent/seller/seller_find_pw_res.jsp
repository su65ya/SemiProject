<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
	String seller_pw = (String)session.getAttribute("seller_pw");
	session.removeAttribute("seller_pw");
%>
    
    
<jsp:include page = "/template/nav.jsp"></jsp:include>


<article class='w-30'>
	
	<div class='row-empty'></div>
	<div class='row-empty'></div>
	
	<div class='row'>
		<h3>조회하신 비밀번호는 <%= seller_pw %> 입니다</h3>
	</div>
	
	<div class='row'>
		<h5><a href="login.jsp">로그인 하러가기</a></h5>
	</div>
	
	<div class='row-empty'></div>
	<div class='row-empty'></div>	


</article>


<jsp:include page= "/template/footer.jsp"></jsp:include>