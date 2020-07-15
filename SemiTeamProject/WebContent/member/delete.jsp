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


<form action="member_delete.do" method="post">

	<article class="w-25">

		<div class="row">
		
			<h1>회원탈퇴</h1>
			
			
			<div calss="row">회원 탈퇴 시 고객님에 관련된 회원정보는 모두 영구 삭제되면 복구할 수 없습니다.</div> <br>
			
	
			<div class="row">
				<input class="form-btn" type="submit" value="회원탈퇴" >
			</div>
			
	</article>
</form>

<jsp:include page="/template/footer.jsp"></jsp:include>