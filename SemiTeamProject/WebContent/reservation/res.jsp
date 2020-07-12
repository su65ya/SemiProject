<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<jsp:include page="/template/nav.jsp"></jsp:include>


<article class="w-50">


	<div class="row">
		<h2>예약하기</h2>	
	</div>
	
	<form action="res_regist.jsp" method="post">
	
		<div class="row-empty"></div>
					
		<div class="row">
			<label><span>*</span>펜션이름</label>
		</div>
			
		<div class="row">
			<label><span>*</span>펜션소개</label>
		</div>
		
		<div class="row">
			<label><span>*</span>펜션 전화번호</label>
		</div>
		
		<div class="row">
			<label><span>*</span>펜션소개</label>
		</div>
		
		<div class="row">
			<label><span>*</span>기본 옵션</label>
		</div>
		
		<hr>		
		
		<div class="row">
			<label><span>*</span>시작일</label>
		</div>
		
		<div class="row">
			<label><span>*</span>종료일</label>
		</div>
		
		<div class="row">
			<label><span>*</span>추가 옵션</label>
		</div>
		
		<hr>
		
		<div class="row">
			<label><span>*</span>옵션 합계</label>
		</div>
		
		<div class="row">
			<a href="#">
				<input class="form-btn form-inline" type="button" value="취소">
			</a>
			<input class="form-btn form-inline" type="submit" value="예약">
		</div>
	
	</form>


</article>


<jsp:include page="/template/footer.jsp"></jsp:include>
    