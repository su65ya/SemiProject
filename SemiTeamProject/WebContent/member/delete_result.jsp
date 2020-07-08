<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
label {
	font-size: 15;
}

#id_check+label {
	color: black;
}

#id_check:checked+label {
	color: silver;
}

.find, a {
	text-align: center;
	text-decoration: none;
	color: black;
}
</style>

<jsp:include page="/template/nav.jsp"></jsp:include>



	<article class="w-25">

<div class="row">
		
			<h1>회원탈퇴 완료</h1>
		
	</article>


<jsp:include page="/template/footer.jsp"></jsp:include>