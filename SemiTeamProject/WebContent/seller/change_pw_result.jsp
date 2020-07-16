<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<jsp:include page="/template/nav.jsp"></jsp:include>
<style>
	a {
		text-decoration: none;
	}
	
</style>



<div class='row-empty'></div>
<div class='row-empty'></div>

 <div class='row center'>
 	<h2>비밀번호가 변경 완료</h2>
 </div>
 
 <div class='row center'>
 	<a href="<%= request.getContextPath() %>">
 		<input class='form-btn form-inline' type="button" value='홈으로'>
 	</a>
 	
 	<a href="seller_info.jsp">
 		<input class='form-btn form-inline' type='button' value='내정보'>
 	</a>
 </div>
 
    
<jsp:include page="/template/footer.jsp"></jsp:include>