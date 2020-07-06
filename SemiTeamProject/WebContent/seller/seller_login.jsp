<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  
<jsp:include page="/template/nav.jsp"></jsp:include>
  
	<form action="seller_login.do" method="post">
			
		
		<article class="w-25">
			
		
			<div class="row">
				<h2>판매자 로그인</h2>
			</div>
			
			<div class="row">
				<input class="form-input" type="text" name="seller_id" placeholder="아이디">
			</div>
			
			<div class="row">
				<input class="form-input" type="password" name="seller_pw" placeholder="비밀번호">
			</div>
			
			<div class="row">
				<input class="form-btn" type="submit" value="로그인">			
			</div>
			
			<div class="row left">
            	<% if (request.getParameter("error") != null) {	%>
				<!-- 오류 메시지는 페이지에 error라는 파라미터가 있을 경우에만 -->
					<font color="#ff0000" size="2px">입력하신 로그인 정보가 맞지 않습니다</font>
				<%} %>
            </div>
			
			<div class="row">
				<input type="checkbox" id="id_check">
				<label for="id_check">ID 저장</label>
			</div>
			
			
					
		</article>
	
	</form>  	
  
  
<jsp:include page="/template/footer.jsp"></jsp:include>