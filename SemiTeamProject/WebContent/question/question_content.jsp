<%@page import="semi.beans.dao.QuestionDao"%>
<%@page import="semi.beans.dto.QuestionDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	int que_no = Integer.parseInt(request.getParameter("que_no"));
    
    	QuestionDao qdao = new QuestionDao();
		QuestionDto qdto = qdao.get(que_no);
    	
    %>
<jsp:include page="/template/nav.jsp"></jsp:include>

<style>
	a {
		text-decoration: none;
	}
	
</style>
    

<article class="w-50">
	<div class="row">
		<h2>문의 내용</h2>
	</div>
	
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
		<% if (qdto.getQue_write() != 0) {%>
			<%= qdto.getQue_write() %>
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
	
	<div class="row" style="min-height: 350px">
		<%= qdto.getQue_content() %>
	</div>
	
	
	<div class="row right">
		<a href="question_edit.jsp?que_no=<%= que_no %>">
			<input class="form-btn form-inline" type="button" value="수정">
		</a>
		<a href="question_delete.do?que_no=<%= que_no %>">
			<input class="form-btn form-inline" type="button" value="삭제">
		</a>r
		<a href="question_write.jsp">
			<input class="form-btn form-inline" type="button" value="글쓰기">
		</a>
		<a href="question_write.jsp?que_no=<%= que_no %>">
			<input class="form-btn form-inline" type="button" value="답글">
		</a>
		<a href="question_list.jsp">
			<input class="form-btn form-inline" type="button" value="목록">
		</a>
	</div>
	

</article>


<jsp:include page="/template/footer.jsp"></jsp:include>





 