<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String go = request.getParameter("go");
%>

<jsp:include page="/template/nav.jsp"></jsp:include>

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
		font-size: 13px;
	}
	
	.form-input,.form-btn2,.form-btn3{
    	width: 100%;
        padding: 0.5rem;
        outline: none;/*선택시 자동 부여되는 테두리 제거*/
        border: none;
    	border-radius: 5px;
    }
    .form-input:focus{
    	border-color: #b2bec3;
    }
    .form-btn2{
        background-color:#636e72;
        width : 150px;
        color: white;
    	cursor: pointer;
    }
    .form-btn3{
        background-color:#ff7675;
        width : 150px;
        color: white;
        cursor: pointer;
    }
    .form-btn2:hover,.form-btn3:hover {
        background-color:#b2bec3;
    }
    .font_color_a {
        color : #636e72;
        font-style: normal;
    	font-size: 14px;
    }
    
    .intext {
		width: 250px;
		padding: 0.5rem;
	}


</style>


<article class =  "w-35"'>


	<div class = "row">
		<h3>사업자 등록번호 입력</h3>
	</div>
	<form action="code_no.do" method="post">
	<div class = "row center">
		<input class= "intext" type="password" name = "code" placeholder="인증번호를 입력해주세요" required>
	</div>	
	<%if(request.getParameter("error") != null){ %>
		<h6><font color="red">인증된 번호가 존재하지 않습니다</font></h6>
		<%} %>
	<div class = "row center">
		<input class="form-btn3 form-inline" type="submit" value="확인">
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