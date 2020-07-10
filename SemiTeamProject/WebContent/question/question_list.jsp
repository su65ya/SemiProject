<%@page import="oracle.net.aso.e"%>
<%@page import="semi.beans.dao.QuestionDao"%>
<%@page import="semi.beans.dto.QuestionDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	int que_pension_no = Integer.parseInt(request.getParameter("que_pension_no"));

	String type = request.getParameter("type");
	String keyword = request.getParameter("keyword");
	
	boolean isSearch = type != null  && keyword != null;
	
	///////////////////////////////////////////////////
	
	int page_size = 10;
	
	String pageStr = request.getParameter("page");
	int page_no;
	try {
		page_no = Integer.parseInt(pageStr);
		if (page_no <= 0 ) {
			throw new Exception();
		}
	}
	catch (Exception e) {
		page_no = 1;
	}
	
	int finish = page_no * page_size;
	int start = finish - (page_size -1);
	
	////////////////////////////////////////
 	
	int block_size = 10;
	int blockStart = (page_no - 1) / block_size * block_size + 1;
	int blockFinish = blockStart +block_size - 1;
	

	QuestionDao qdao = new QuestionDao();
	
	int count;
	if (isSearch) {
		count = qdao.getSearch(type, keyword);
	}
	else{
		count = qdao.getCount();
	}
	
	int pageCount = (count + page_size - 1) / page_size;
	if (blockFinish > pageCount) {
		blockFinish = pageCount;
	}
	
	List<QuestionDto> list;
	if (isSearch) {
		list = qdao.search(que_pension_no, type, keyword, start, finish);
	}
	else {
		list = qdao.getlist(que_pension_no, start, finish);
	}

%>


<jsp:include page="/template/nav.jsp"></jsp:include>    

<style>
	a {
		text-decoration: none;
		color: black;
	}
	
	 select {
    	height: 37px;
    	font-size: 15px;
    }

</style>


<article class = "w-50">
	
	<div class="row-empty"></div>
	
	<div class="row">
		<h1>문의</h1>
	</div>
	
	<div class="row-empty"></div>
	
	<table class="table table-sideopen table-hover">
		<thead>
			<tr>
				<th>번호</th>
				<th width="50%">제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			
			<% for (QuestionDto qdto : list) { %>			
			<tr>
				<td><%= qdto.getQue_no() %></td>

				<td class="left">
				
					<font color="red" size="2">
					 	<% if(qdto.getQue_reply() != null) { %>
					 		<span>답변 완료</span>					 		
					 	<%} %>
					</font>
					
					<font color="gray" size="3">
						<% if(qdto.getQue_head() != null) { %>
							[<%= qdto.getQue_head() %>]
						<%} %>
					</font>
					
					<a href="question_content.jsp?que_pension_no=<%= qdto.getQue_pension_no() %>&que_no=<%= qdto.getQue_no() %>">
						<%= qdto.getQue_title() %>
					</a>
				</td>
				<td>
					<% if (qdto.getQue_writer() != 0) {%>
						<%= qdto.getQue_writer() %>
					<%} else {%>
						<font color="gray">XXX</font>
					<%} %>
				</td>
				<td><%= qdto.getQue_auto() %></td>
				<td><%= qdto.getQue_view() %></td>
			</tr>
			<%} %>
		</tbody>
	</table>

	<div class="row right">
		<a href="question_write.jsp?que_pension_no=<%= que_pension_no %>">
			<input class="form-btn form-inline" type="button" value="글쓰기">
		</a>
	</div>
	
	
	<div class="row center pagination">
	
		<!-- 이전 -->
		<% if (blockStart > 1) { %>
			<%if (!isSearch) { %>
				<a href="question_list.jsp?que_pension_no=<%= que_pension_no %>&page=<%= blockStart - 1 %>">&lt;</a>
			<%} else { %>
				<a href="question_list.jsp?&que_pension_no=<%= que_pension_no %>page=<%= blockStart - 1 %>&type=<%= type %>&keyword=<%= keyword %>">&lt;</a>
			<%} %>
		<%} %>
		
		<% for (int i = blockStart; i <= blockFinish; i++) {%>
		
			<% if (!isSearch) { %>	
				<a href="question_list.jsp?que_pension_no=<%= que_pension_no %>&page=<%= i %>"><%= i %></a>
			<%} else { %>
				<a href="question_list.jsp?que_pension_no=<%= que_pension_no %>&page=<%= i %>&type=<%= type %>&keyword=<%= keyword %>"><%= i %></a>
			<%} %>
		<%} %>
		
		<!-- 다음 -->
		<% if (blockFinish < pageCount) { %>
			<%if (!isSearch) { %>
				<a href="question_list.jsp?que_pension_no=<%= que_pension_no %>&page=<%= blockFinish + 1 %>">&gt;</a>
			<%} else { %>
				<a href="question_list.jsp?que_pension_no=<%= que_pension_no %>&page=<%= blockFinish + 1 %>&type=<%= type %>&keyword=<%= keyword %>">&gt;</a>
			<%} %>
		<%} %>
		
	</div>
	
	
	
	<!-- 검색창 -->
	<div class="row center">
		<form action="question_list.jsp?" method="get">
			<input type="hidden" name="que_pension_no" value="<%= que_pension_no %>">
			<select class="form-input form-inline" name="type">
				<option value="que_title">제목</option>
				<option value="que_writer">작성자</option>
			</select>
			
			<% if (keyword != null) { %>
				<input class="form-input form-inline" type="text" name="keyword" value="<%= keyword %>">
			<%} else {%>
				<input class="form-input form-inline" type="text" name="keyword">
			<%} %>
			
			<input class="form-btn form-inline" type="submit" value="검색">
			
		</form>
	</div>	
		
		
	<div class="row-empty"></div>
	<div class="row-empty"></div>
	<div class="row-empty"></div>
	<div class="row-empty"></div>

</article>



<jsp:include page="/template/footer.jsp"></jsp:include>