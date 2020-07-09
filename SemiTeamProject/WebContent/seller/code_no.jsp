<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String go = request.getParameter("go");
%>

<jsp:include page="/template/nav.jsp"></jsp:include>


<article class =  "w-35"'>
	<div class = "row-empty"></div>
	<div class = "row-empty"></div>

	<div class = "row">
		<h3>사업자 등록번호 입력</h3>
	</div>
	<form action="code_no.do" method="post">
	<div class = "row center">
		<input class= "form-input form-inline" type="password" name = "code" placeholder="인증번호를 입력해주세요" required>
	</div>	
	<%if(request.getParameter("error") != null){ %>
		<h6><font color="red">인증된 번호가 존재하지 않습니다</font></h6>
		<%} %>
	<div class = "row center">
	<div class = "row-empty"></div>
		<input class="form-btn form-inline" type="submit" value="확인">
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