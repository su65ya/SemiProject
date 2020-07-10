<%@page import="semi.beans.dto.QuestionDto"%>
<%@page import="semi.beans.dao.QuestionDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int que_no = Integer.parseInt(request.getParameter("que_no"));
	int que_pension_no = Integer.parseInt(request.getParameter("que_pension_no"));
	
	QuestionDao qdao = new QuestionDao();
	QuestionDto qdto = qdao.get(que_no);
%>



<jsp:include page="/template/nav.jsp"></jsp:include>

<style>
	a {
		text-decoration: none;
	}

    div > label{
    	font-size:13;
    }
    
    select {
    	height: 35px;
    	font-size: 15px;
    }
    
     textarea {
		resize: none;
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
	// - true를 반환하면 전송o : 입력값이 있을 때
	// - false를 반환하면 전송x : 입력값이 없을 때
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




<form action="question_reply.do" method="post" onsubmit="return formCheck();">
	
	<% if (request.getParameter("que_no") != null) { %>
		<input type="hidden" name="que_no"
			value="<%=request.getParameter("que_no")%>">
	<%}	%>
	
	<% if (request.getParameter("que_pension_no") != null) { %>
		<input type="hidden" name="que_pension_no"
			value="<%=request.getParameter("que_pension_no")%>">
	<%}	%>


	<article class="w-50">
		

		<div class="row">
			<h2>답글 작성</h2>
		</div>
		
		<div class="row-empty"></div>
	
		
		<div class="row">
		<font size="5">
			<font color="gray" size="4">
			<% if (qdto.getQue_head() != null) { %>
				[<%= qdto.getQue_head() %>]
			<%} %>
			</font>
			<%= qdto.getQue_title() %>
		</font>
	</div>
	
	<div class="row">
		<% if (qdto.getQue_writer() != 0) {%>
			<%= qdto.getQue_writer() %>
		<%} else {%>
			<font color="gray">XXX</font>
		<%} %>
	</div>
	
	<div class="row">
		<%= qdto.getQue_date() %> / 
		<%= qdto.getQue_view() %>
	</div>

	
	<div class="row-empty">
		<hr>
	</div>
	
	<div class="row" style="min-height: 300px">
		<%= qdto.getQue_content() %>
	</div>
	
	
	<form action="question_reply.do" method="post">
	
		<div class="row center">
			<input type="hidden" name="que_no" value="<%= que_no %>">
			<input type="hidden" name="que_pension_no" value="<%= que_pension_no %>">
			<textarea class="form-input" name="que_reply" rows="5px" cols="100px"><%if ( qdto.getQue_reply() != null ) {%><%= qdto.getQue_reply() %><%} %></textarea>
		</div>
		
		<div class="row right">
			<a href = "question_content.jsp?que_pension_no=<%= que_pension_no %>&que_no=<%= que_no %>">
				<input class="form-btn form-inline" type="button" value="취소">
			</a>
			<input class="form-btn form-inline" type="submit" value="등록">
		</div>
		
	</form>
	
		
	
	<div class="row-empty"></div>
	<div class="row-empty"></div>
	
	</article>

</form>



<jsp:include page="/template/footer.jsp"></jsp:include>