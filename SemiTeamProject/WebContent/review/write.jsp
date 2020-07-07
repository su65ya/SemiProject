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


<form action="review_write.do" method="post">
	<article class="w-40">
		<div class="row">
			<label><span>*</span>리뷰 제목</label>
			<input class="form-input" type="text" name="review_title">
		</div>
		
		<div class="row">
			<label><span>*</span>리뷰 내용</label><br>
			<textarea name="review_content" rows="10px" cols="80px"></textarea>
		</div>
		
	
		<!-- 첨부 파일 -->
		<div class="row">
			<label>첨부파일</label><br>
			<input type="file" name="review_file" multiple accept=".jpg, .png, .gif">
		</div> 
		
		
		<div class="row">
			<input class="form-btn" type="submit" value="등록">
		</div>		


	</article>
</form>





<jsp:include page="/template/footer.jsp"></jsp:include>