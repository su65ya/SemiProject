<%@page import="semi.beans.dto.QuestionViewDto"%>
<%@page import="semi.beans.dto.QuestionDto"%>
<%@page import="semi.beans.dao.QuestionDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int que_no = Integer.parseInt(request.getParameter("que_no"));
	int que_pension_no = Integer.parseInt(request.getParameter("que_pension_no"));
	
	QuestionDao qdao = new QuestionDao();
	QuestionViewDto qvdto = qdao.get(que_no);
%>



<jsp:include page="/template/nav.jsp"></jsp:include>

<style>

    div > label{
    	font-size:13;
    }
    
    select {
    	height: 35px;
    	font-size: 15px;
    }
    
</style>

 <!-- suneditor CDN -->    
<link href="https://cdn.jsdelivr.net/npm/suneditor@latest/dist/css/suneditor.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/suneditor@latest/dist/suneditor.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/suneditor@latest/src/lang/ko.js"></script>  

<script>
	
	window.onload = function() {
    	 // 에디터 생성
        window.editor = SUNEDITOR.create(
        	 // 적용대상
            (document.getElementById('sample') || 'sample'),
             // 적용옵션
            {
            	// 언어 설정
                lang: SUNEDITOR_LANG['ko']
                    
                // 폭 설정
                , width: '100%'
                
                , minHeight : '400px' 
                    
                // 높이 설정
                , height: '250px'
                
                    
                , buttonList : [
                	['font', 'fontSize', 'formatBlock'],
                    ['bold', 'underline', 'italic', 'strike'],
                    ['fontColor', 'hiliteColor', 'outdent', 'indent', 'align', 'table'],
                    ['fullScreen', 'codeView']
                ],
                    
                        
            }
        );
	}
        
	// 폼을 전송하기 전 수행할 함수
	function formCheck() {
	    var content = editor.getContents();
	    console.log(content);
            	
    	if(!content || content == '<p><br></p>') { // 미입력
	    	alert('내용은 반드시 작성하세요');
    	} 
    	else {  // 입력된 경우는 에디터의 내용(content)을 textarea에 복사
	    	var textarea = editor.getContext().element.originElement;
        	textarea.value = content;
    	}
    	return true;
	}
        
</script>




<form action="question_edit.do" method="post" onsubmit="return formCheck();">
	
	<% if (request.getParameter("que_no") != null) { %>
		<input type="hidden" name="que_no"
			value="<%=request.getParameter("que_no")%>">
	<%}	%>
	
	<% if (request.getParameter("que_pension_no") != null) { %>
		<input type="hidden" name="que_pension_no"
			value="<%=request.getParameter("que_pension_no")%>">
	<%}	%>


	<article class="w-50">
		
		<div class="row-empty"></div>

		<div class="row">
			<h2>문의 수정</h2>
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
			<input class="form-input" type="text" name="que_title" value="<%= qvdto.getQue_title() %>" required  style="width: 85%">
		</div>
		
		<div class="row">
			<textarea name="que_content" cols="100px" rows="20px"><%= qvdto.getQue_content() %></textarea>
		</div>
		
		<div class="row">
			<input class="form-btn" type="submit" value="등록">
		</div>
	
	<div class="row-empty"></div>
	<div class="row-empty"></div>
	
	</article>

</form>



<jsp:include page="/template/footer.jsp"></jsp:include>