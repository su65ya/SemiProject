<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<jsp:include page="/template/nav.jsp"></jsp:include>

<style>
	a {
		text-decoration: none;
	}

</style>


<div align="center">

	<article class="w-25">

		<div class="row">
			<h1>회원탈퇴 완료</h1>
		</div>
			
		<div class='row center'>
		 	<a href="<%= request.getContextPath() %>">
		 		<input class='form-btn form-inline' type="button" value='홈으로'>
		 	</a>
		 	<a href="seller_join.jsp">
		 		<input class='form-btn form-inline' type='button' value='회원가입'>
		 	</a>
		</div>			
		
	</article>

</div>

<jsp:include page="/template/footer.jsp"></jsp:include>   
    