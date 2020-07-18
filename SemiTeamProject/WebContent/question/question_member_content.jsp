<%@page import="semi.beans.dto.QuestionViewDto"%>
<%@page import="semi.beans.dto.SellerDto"%>
<%@page import="semi.beans.dto.MemberDto"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="semi.beans.dao.QuestionDao"%>
<%@page import="semi.beans.dto.QuestionDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	int que_no = Integer.parseInt(request.getParameter("que_no"));
    	
    	SellerDto sdto = (SellerDto) session.getAttribute("sellerinfo");
    
    //////////////////////////////////////////////////////////////////////////////////
    
	    Set<Integer> memory  = (Set<Integer>) session.getAttribute("memory");
	
	    if (memory ==null) {
			memory = new HashSet<>();    	
	    }
	    
	    boolean isCount = memory.add(que_no);
	    
	    session.setAttribute("memory", memory);
	    
	    QuestionDao qdao = new QuestionDao();
		QuestionViewDto qvdto = qdao.get(que_no);	    
    	
		
	    MemberDto user = (MemberDto) session.getAttribute("userinfo");
	    
	    if (user != null) {
		    if (isCount) {
		    	qdao.viewCount(que_no, user.getMember_no());
		    }
	    }
	    
    %>
<jsp:include page="/template/nav.jsp"></jsp:include>
<link rel="stylesheet" href="../css/question.css" type="text/css">

<style>
	.find, a {
		text-align: center;
		text-decoration: none;
		color: black;
	}
 	textarea {
		resize: none;
	}
	   
</style>
    
<% if (request.getParameter("que_pension_no") != null) { %>
	<input type='hidden' name='que_pension_no' value='<%= request.getParameter("que_pension_no") %>'>
<%} %>

<article class="w-50">
	<div class="row">
		<h2>문의 내용</h2>
	</div>	
	
	<div class="row">
	
		<font color="red" size="2">
			<% if(qvdto.getQue_reply() != null) { %>
				<span>답변 완료</span>					 		
			<%} %>
		</font>
		
	
		<font size="5">
			<font color="gray" size="4">
			<% if (qvdto.getQue_head() != null) { %>
				[<%= qvdto.getQue_head() %>]
			<%} %>
			</font>
			<%= qvdto.getQue_title() %>
		</font>
		
	</div>
	
	<div class="row">
		<font size="5">
			<% if (qvdto.getQue_writer() != 0) {%>
				<%= qvdto.getMember_id() %>
			<%} else {%>
				<font color="gray">XXX</font>
			<%} %>
		</font>
	
	</div>
	
	<div class="row">
		<%= qvdto.getQue_day_hour() %> /
		<%= qvdto.getQue_view() %>
	</div>
	
	<div class="row-empty">
		<hr>
	</div>
	
	<div class="row" style="min-height: 300px">
		<%= qvdto.getQue_content() %>
	</div>
	
	<div class="row-empty">
		<hr>
	</div>
	
	<% if ( qvdto.getQue_reply() != null ) { %>
		<div class="row">
			<h4 class="left">관리자</h4>
			<%= qvdto.getQue_reply() %>
		</div>
	<%} %>
	
	<div class="row-empty"></div>
	<div class="row right">

		<% if (user.getMember_no() == qvdto.getQue_writer()) { %>
			<a href="<%= request.getContextPath() %>/member/check.jsp?go=<%= request.getContextPath() %>/question/question_edit.jsp?que_no=<%= que_no %>">
				<input class="form-btn3 " type="button" value="문의수정">
			</a>
			
			<a href="<%= request.getContextPath() %>/member/check.jsp?go=<%= request.getContextPath() %>/question/question_delete.do?que_no=<%= que_no %>">
				<input class="form-btn3 " type="button" value="삭제">
			</a>
		<%} %>	
		<a href="question_write.jsp?que_pension_no=<%= qvdto.getQue_pension_no() %>">
			<input class="form-btn2 " type="button" value="글쓰기">
		</a>
				
		<a href="question_list.jsp?que_pension_no=<%= qvdto.getQue_pension_no() %>">
			<input class="form-btn2" type="button" value="목록">
		</a>
	</div>
	

</article>


<jsp:include page="/template/footer.jsp"></jsp:include>





 