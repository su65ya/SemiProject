<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<jsp:include page="/template/nav.jsp"></jsp:include>
<link rel="stylesheet" href="../css/question.css" type="text/css">


<style>

    div > label{
    	font-size:13;
    }
    
    select {
    	height: 35px;
    	font-size: 15px;
    }
    
</style>

<form action="question_write.do" method="post" onsubmit="return formCheck();">

	
	<% if (request.getParameter("que_pension_no") != null) { %>
		<input type="hidden" name="que_pension_no"
			value="<%=request.getParameter("que_pension_no")%>">
	<%}	%>
	

	<article class="w-50">
		
		<div class="row-empty"></div>

		<div class="row">
			<h2>문의 작성</h2>
		</div>
		
		<div class="row-empty"></div>		
		
		<div class="row">
			<label>문의유형</label>
			<select name="que_head">
				<option value="">선택</option>
				<option>예약</option>
				<option>예약취소</option>
				<option>예약변경</option>
				<option>기타</option>
			</select>
		</div>
		
		<div class="row">
			<label>&nbsp;&nbsp;&nbsp;제목&nbsp;&nbsp;&nbsp;</label>
			<input class="intext" type="text" name="que_title" placeholder="문의 제목을 입력해 주세요" required  style="width: 85%">
		</div>
		
		<div class="row">
			<textarea name="que_content" cols="102px" rows="20px"></textarea>
		</div>
		
		<div class="row">
			<input class="form-btn3" style='width: 100%;' type="submit" value="등록">
		</div>
	
	<div class="row-empty"></div>
	<div class="row-empty"></div>
	
	</article>

</form>



<jsp:include page="/template/footer.jsp"></jsp:include>