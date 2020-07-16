<%@page import="semi.beans.dao.PensionDao"%>
<%@page import="semi.beans.dto.PensionInfoDto"%>
<%@page import="semi.beans.dto.QuestionViewDto"%>
<%@page import="semi.beans.dto.SellerDto"%>
<%@page import="semi.beans.dto.MemberDto"%>
<%@page import="oracle.net.aso.e"%>
<%@page import="semi.beans.dao.QuestionDao"%>
<%@page import="semi.beans.dto.QuestionDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<%

	// 펜션 별 펜션 리스트

	MemberDto mdto = (MemberDto) session.getAttribute("userinfo");
	SellerDto sdto = (SellerDto) session.getAttribute("sellerinfo");
	
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
	
	int count;	// 목록 개수 or 검색 개수
	if (isSearch) {
		count = qdao.getCount(que_pension_no, type, keyword);
	}
	else{
		count = qdao.getCount(que_pension_no);
	}
	
	int pageCount = (count + page_size - 1) / page_size;
	if (blockFinish > pageCount) {
		blockFinish = pageCount;
	}
	
	List<QuestionViewDto> list;
	if (isSearch) {
		list = qdao.search(que_pension_no, type, keyword, start, finish);
	}
	else {
		list = qdao.getList(que_pension_no, start, finish);
	}
	
	PensionDao pdao = new PensionDao();
	PensionInfoDto pdto = pdao.get(que_pension_no);

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

<% if (request.getParameter("que_pension_no") != null) { %>
	<input type='hidden' name='que_pension_no' value='<%= request.getParameter("que_pension_no") %>'>
<%} %>


<article class = "w-70">
	
	<div class="row-empty"></div>
	
	<div class="row">
		<h1><%= pdto.getPension_name() %>펜션 문의</h1>
	</div>
	
	<div class="row-empty"></div>
	<%-- 
	<div class="row right">
		<% if (mdto != null) { %>	
			<a href="<%= request.getContextPath() %>/member/search_pension_derail.jsp?pension_no=<%= pension_no %>">
				<input class="form-btn form-inline" type="button" value="펜션정보">
			</a>
		<%} else {%>
			<a href="<%= request.getContextPath() %>/seller/pension_detail.jsp?pension_no=<%= que_pension_no %>">
				<input class="form-btn form-inline" type="button" value="펜션정보">
			</a>
		<%} %>
	</div>
	 --%>
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
			
			<% for (QuestionViewDto qvdto : list) { %>			
			<tr>
				<td><%= qvdto.getQue_no() %></td>
				
				<td class="left">
					
					<font color="red" size="2">
					 	<% if(qvdto.getQue_reply() != null) { %>
					 		<span>답변 완료</span>					 		
					 	<%} %>
					</font>
					
					<font color="gray" size="3">
						<% if(qvdto.getQue_head() != null) { %>
							[<%= qvdto.getQue_head() %>]
						<%} %>
					</font>
					<% if (sdto != null) { %>
						<a href="question_content.jsp?que_pension_no=<%= que_pension_no %>&que_no=<%= qvdto.getQue_no() %>">
							<%= qvdto.getQue_title() %>
						</a>
					<%} else if (mdto != null) { %>
						<a href="question_member_content.jsp?que_pension_no=<%= que_pension_no %>&que_no=<%= qvdto.getQue_no() %>">
							<%= qvdto.getQue_title() %>
						</a>
					<%} %>
				</td>
				<td>
					<% if (qvdto.getQue_writer() != 0) {%>
						<%= qvdto.getMember_id() %>
					<%} else {%>
						<font color="gray">XXX</font>
					<%} %>
				</td>
				<td><%= qvdto.getQue_auto() %></td>
				<td><%= qvdto.getQue_view() %></td>
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
				<a href="question_list.jsp?que_pension_no=<%= que_pension_no %>&page=<%= blockStart - 1 %>">이전</a>
			<%} else { %>
				<a href="question_list.jsp?&que_pension_no=<%= que_pension_no %>page=<%= blockStart - 1 %>&type=<%= type %>&keyword=<%= keyword %>">이전</a>
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
		<% if (pageCount >blockFinish) { %>
			<%if (!isSearch) { %>
				<a href="question_list.jsp?que_pension_no=<%= que_pension_no %>&page=<%= blockFinish + 1 %>">다음</a>
			<%} else { %>
				<a href="question_list.jsp?que_pension_no=<%= que_pension_no %>&page=<%= blockFinish + 1 %>&type=<%= type %>&keyword=<%= keyword %>">다음</a>
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