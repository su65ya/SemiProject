<%@page import="semi.beans.dao.QuestionDao"%>
<%@page import="semi.beans.dto.QuestionDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	String type = request.getParameter("type");
	String keyword = request.getParameter("keyword");
	
	boolean isSearch = type != null  && keyword != null;

	List<QuestionDto> list = new ArrayList<>();
	QuestionDao qdao = new QuestionDao();
	
	if (isSearch) {
		list = qdao.search(type, keyword);		
	}
	else {
		list = qdao.getlist();
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


<article class = "w-65">
	
	<div class="row-empty"></div>
	
	<div class="row">
		<h2>문의 게시판</h2>
	</div>
	
	<div class="row-empty"></div>
	
	<table class="table table-sideopen table-hover">
		<thead>
			<tr>
				<th>번호</th>
				<th width="40%">제목</th>
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
					
					<!-- 답글 띄어쓰기 -->
					<% if (qdto.getDepth() > 0) { %>
						<% for(int i = 0; i < qdto.getDepth(); i++) { %>
							&nbsp;&nbsp;&nbsp;
						<%} %>
						<!-- <img src="http://placehold.it/20x15"> -->
					<%} %>
					
					<font color="gray" size="3">
						<% if(qdto.getQue_head() != null) { %>
							[<%= qdto.getQue_head() %>]
						<%} %>
					</font>
					
					<a href="question_content.jsp?que_no=<%= qdto.getQue_no() %>">
						<%= qdto.getQue_title() %>
					</a>
				</td>
				<td><%= qdto.getQue_write() %></td>
				<td><%= qdto.getQue_date() %></td>
				<td><%= qdto.getQue_view() %></td>
			</tr>
			<%} %>
			
		</tbody>
	</table>

	<div class="row right">
		<a href="question_write.jsp">
			<input class="form-btn form-inline" type="button" value="글쓰기">
		</a>
	</div>
	
	<!-- 검색창 -->
	<div class="row center">
		<form action="question_list.jsp" method="get">
			<select class="form-input form-inline" name="type">
				<option value="que_title">제목</option>
				<option value="que_write">작성자</option>
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