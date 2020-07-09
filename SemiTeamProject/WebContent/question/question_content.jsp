<%@page import="semi.beans.dto.MemberDto"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="semi.beans.dao.QuestionDao"%>
<%@page import="semi.beans.dto.QuestionDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	int que_no = Integer.parseInt(request.getParameter("que_no"));
    	int que_pension_no = Integer.parseInt(request.getParameter("que_pension_no"));
    
    //////////////////////////////////////////////////////////////////////////////////
    
	    Set<Integer> memory  = (Set<Integer>) session.getAttribute("memory");
	
	    if (memory ==null) {
			memory = new HashSet<>();    	
	    }
	    
	    boolean isCount = memory.add(que_no);
	    
	    session.setAttribute("memory", memory);
	    
	    QuestionDao qdao = new QuestionDao();
    	
	    MemberDto user = (MemberDto) session.getAttribute("userinfo");
	    if (isCount) {
	    	qdao.viewCount(que_no, user.getMember_no());
	    }
	    
	    
    	
		QuestionDto qdto = qdao.get(que_no);
    	
    %>
<jsp:include page="/template/nav.jsp"></jsp:include>


<style>
	a {
		text-decoration: none;
	}
	
 	textarea {
		resize: none;
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
		<% if (qdto.getQue_writer() != 0) {%>
			<%= qdto.getQue_writer() %>
		<%} else {%>
			<font color="gray">XXX</font>
		<%} %>
	</div>
	
	<div class="row">
		<%= qdto.getQue_auto() %> / 
		<%= qdto.getQue_view() %>
	</div>
	
	<div class="row-empty">
		<hr>
	</div>
	
	<div class="row" style="min-heighx`: 300px">
		<%= qdto.getQue_content() %>
	</div>
	
	<div class="row">
		<% if ( qdto.getQue_reply() != null ) { %>
			<%= qdto.getQue_reply() %>
		<%} %>
	</div>
	
	
	<%-- 	
		<form action="question_reply.do" method="post">
			<div class="row center">
				<input type="hidden" name="que_no" value="<%= que_no %>">
				<input type="hidden" name="que_pension_no" value="<%= que_pension_no %>">
			</div>
		</form>
	 --%>
	
	

	<div class="row right">
		<a href="question_edit.jsp?que_no=<%= que_no %>">
			<input class="form-btn form-inline" type="button" value="수정">
		</a>
		<a href="question_delete.do?que_no=<%= que_no %>">
			<input class="form-btn form-inline" type="button" value="삭제">
		</a>
		<a href="question_write.jsp">
			<input class="form-btn form-inline" type="button" value="글쓰기">
		</a>
		<a href="question_reply.jsp?que_pension_no=<%= que_pension_no %>&que_no=<%= que_no %>">
			<input class="form-btn form-inline" type="button" value="답변">
		</a>
		<a href="question_list.jsp?que_pension_no=<%= que_pension_no %>">
			<input class="form-btn form-inline" type="button" value="목록">
		</a>
	</div>
	

</article>


<jsp:include page="/template/footer.jsp"></jsp:include>





 