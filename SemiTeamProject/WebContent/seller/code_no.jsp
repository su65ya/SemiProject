<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String go = request.getParameter("go");
%>

<jsp:include page="/template/nav.jsp"></jsp:include>
<style>
	.button{
	padding: 0.5rem;
		border-radius: 5px;
		outline: none;
		border:none;
	}
</style>

<article class =  "w-40"'>
	<div class = "row-empty"></div>
	<div class = "row-empty"></div>

	<div class = "row">
		<h3>사업자 등록번호 입력</h3>
	</div>
	<form action="code_no.do" method="post">
	<div class = "row center">
		<input style = "width:180px;" class= "form-input form-inline" type="password" name = "code" placeholder="인증번호를 입력해주세요" required>
	</div>	
	<%if(request.getParameter("error") != null){ %>
		<h6><font color="red">인증된 번호가 존재하지 않습니다</font></h6>
		<%} %>
	<div class = "row center">
	<div class = "row-empty"></div>
		<input class="button form-btn3 form-inline" type="submit" value="확인">
	</div>
	</form>
	<div class = "row">
		<h4>
			<a href="#"></a>
		</h4>
	</div>	
	
	<div class="row-empty"></div>
	<div class="row-empty"></div>
	<div class="row-empty"></div>
	<div class="row-empty"></div>

</article>
<jsp:include page="/template/footer.jsp"></jsp:include>