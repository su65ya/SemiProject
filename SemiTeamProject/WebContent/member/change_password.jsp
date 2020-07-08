<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/nav.jsp"></jsp:include>
 <div align="center">
 	<h2>비밀번호 변경</h2>
 	
 	<form action="change_password.do" method="post">
 		<input type="password" placeholder="현재 비밀번호"> <br>
 		<input type="password" name="member_pw" required placeholder="새 비밀번호"> <br>
 		<input type="password" required placeholder="새 비밀번호 확인"> <br>
 		<input type="submit" value="변경">	 <br>
 		
 	</form>
 	
 	<input type="button" value="취소">
 </div>
    
<jsp:include page="/template/footer.jsp"></jsp:include>