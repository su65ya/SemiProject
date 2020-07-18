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
		width: 100%;
		padding-left: 0.5rem;
	}
    
</style>

<jsp:include page="/template/nav.jsp"></jsp:include>


<form action="member_login.do" method="post">

	<article class="w-20">

		<div class="row">
			<h2>회원 로그인</h2>
		</div>

		<div class="row">
			<input class="form-input" type="text" name="member_id" placeholder="아이디" required>
		</div>

		<div class="row">
			<input class="form-input" type="password" name="member_pw"	placeholder="비밀번호" required>
		</div>

		<div class="login-checkbox-wrap">
			<input class="login-checkbox" type="checkbox" name="id_check">
			<label for="idsave">ID 저장</label>
		</div>
		
		<div class="row center">
			<input class="form-btn2" type="submit" value="로그인">
		</div>

		<div class="row">
           	<% if (request.getParameter("error") != null) {	%>
			<!-- 오류 메시지는 페이지에 error라는 파라미터가 있을 경우에만 -->
			<font color="#ff0000" size="2px">입력하신 로그인 정보가 맞지 않습니다</font>
			<%} %>
        </div>
		<div class = "row find">
			<a href = "member_find_id.jsp">ID 찾기</a>
			<a href = "member_find_pw.jsp">PW 찾기</a>
		</div>            

		<div class="row-empty"></div>
		<div class="row-empty"></div>


	</article>
</form>

<jsp:include page="/template/footer.jsp"></jsp:include>