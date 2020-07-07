<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<style>
    	span{
    		color:red;
    		font-size:16;
    	}
    	label{
    		font-size:13;
    	}
    </style>
    
<jsp:include page="/template/nav.jsp"></jsp:include>
	<div class="row">
	<form action = "admin_join.do" method="post">
		
		<article class="w-30">
			
			<div class = "row">
				<h2>관리자 회원가입</h2>
			</div>
			
			<div class="row">
				<label><span>*</span>아이디</label>
				<input class="form-input" type="text" name="admin_id" placeholder="아이디는 8~20자 이내로 입력하세요" required autocomplete="none">
			</div>
			<div class="row">
				<label><span>*</span>비밀번호</label>
				<input class="form-input" type="password" name="admin_pw" placeholder="비밀번호는 8~20자 이내로 입력하세요" required autocomplete="none">
			</div>
			
			<div class="row">
				<label><span>*</span>핸드폰번호</label>
				<input class="form-input" type="text" name="admin_phone" placeholder="'-' 제외 번호입력">
			</div>
			
			<div class="row">
				<label><span>*</span>이메일</label>
				<input class="form-input" type="email" name="admin_mail"placeholder="이메일">
			</div>
			
			<div class="row">
				<label><span>*</span>생년월일</label>
				<input class="form-input" type="date" name="admin_birth"autocomplete="none">
			</div>
			
			<div class = "row-empty"></div>
			<div class="row">
				<input class= "form-btn" type="submit" value="회원가입하기">
			</div>
		</article>
	</form>
</div>
<jsp:include page="/template/footer.jsp"></jsp:include>