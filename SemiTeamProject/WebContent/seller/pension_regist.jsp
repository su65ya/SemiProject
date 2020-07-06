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
	<article class="w-40">
		<form action="pension_regist.do" method="post">
			<div class="row-empty"></div>
			<div class="row">
				<h2>펜션 등록</h2>
			</div>
			<div class="row-empty"></div>
			<div class="row">
				<label><span>*</span>펜션 이름</label>
				<input class="form-input" type="text" name="pension_name" placeholder="16자 이내" required>
			</div>
			<div class="row">
				<label><span>*</span>주소 입력</label><br>
				<input class="form-input form-inline" type="text" name="pension_post" placeholder="우편번호" required>
				<input type="button" value="우편번호 찾기">
			</div>
			<div class="row">
				<input class="form-input" type="text" name="pension_basic_addr" placeholder="기본주소" required>
			</div>
			<div class="row">
				<input class="form-input" type="text" name="pension_detail_addr" placeholder="상세주소" required>
			</div>
			<div class="row">
				<label><span>*</span>펜션 전화번호</label>
				<input class="form-input" type="text" name="pension_phone" placeholder="펜션 전화번호" required>
			</div>
			<div class="row-empty"></div>
			<div class="row-empty"></div>
			<div class="row">
				<input class= "form-btn" type="submit" value="등록하기">
			</div>
			<div class="row"></div>
		
		</form>
	</article>


<jsp:include page="/template/footer.jsp"></jsp:include>