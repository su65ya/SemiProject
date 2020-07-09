<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import ="semi.beans.dao.SellerDao" %>

<%
    SellerDao mdao = (SellerDao) session.getAttribute("userinfo");
 %>

  
<jsp:include page="/template/nav.jsp"></jsp:include>

<div align="center">

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


	<article class="w-25">

<div class="row">
		
			<h1>회원탈퇴 완료</h1>
		
	</article>

   


</div>

<jsp:include page="/template/footer.jsp"></jsp:include>   
    