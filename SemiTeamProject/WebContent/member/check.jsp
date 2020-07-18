<%@page import="semi.beans.dto.SellerDto"%>
<%@page import="semi.beans.dto.AdminDto"%>
<%@page import="semi.beans.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String go = request.getParameter("go");
	
%>

<jsp:include page="/template/nav.jsp"></jsp:include>
<style>
	  .form-input,.form-btn2,.form-btn3{
	    	width: 100%;
	        padding: 0.5rem;
	        outline: none;	/*선택시 자동 부여되는 테두리 제거*/
	        border: none;
	    	border-radius: 5px;
	    }

		.form-btn2{
	        background-color:#636e72;
	        width : 100px;
	        color: white;
	    	cursor: pointer;
	    }
	    
	    .form-btn3{
	        background-color:#ff7675;
	        width : 200px;
	        color: white;
	        cursor: pointer;
	    }
	    
	    .form-btn2:hover, .form-btn3:hover {
	        background-color:#b2bec3;
	    }
	    
	    .font_color_a {
	        color : #636e72;
	        font-style: normal;
	    	font-size: 14px;
	    }
	    
	    .intext {
			width: 200px;
			padding-left: 0.5rem;
			padding: 0.5rem;
		}

</style>

<article class =  "w-35"'>
	<div class = "row-empty"></div>
	<div class = "row-empty"></div>

	<div class = "row">
		<h3>비밀번호 확인</h3>
	</div>
	
	<form action="check.do" method="post">
	<div class = "row center">
		<input type="hidden" name="go" value="<%=go %>">
		<input class= "intext" type="password" name = "member_pw" placeholder="비밀번호 입력하세요" required>

	</div>	
		<%if(request.getParameter("error") != null){ %>
			<h6><font color="red">비밀번호가 일치하지 않습니다</font></h6>
			<%} %>
		<div class = "row center">
		<div class = "row-empty"></div>
			<input class="form-btn3" type="submit" value="확인">
		</div>
	</form>
	
	<div class="row-empty"></div>
	<div class="row-empty"></div>
	<div class="row-empty"></div>
	<div class="row-empty"></div>	

</article>


<jsp:include page="/template/footer.jsp"></jsp:include>