<%@page import="semi.beans.dto.SellerDto"%>
<%@page import="semi.beans.dto.MemberDto"%>
<%@page import="semi.beans.dao.ReviewDao"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.dto.ReviewDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 펜션 별 펜션 리스트
	MemberDto mdto = (MemberDto) session.getAttribute("userinfo");
	SellerDto sdto = (SellerDto) session.getAttribute("sellerinfo");
	
	int review_pension_no = Integer.parseInt(request.getParameter("review_pension_no"));
	
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
	
	ReviewDao revdao = new ReviewDao();
	
	int count;
	if (isSearch) {
		count = revdao.getSearch(type, keyword);
	}
	else{
		count = revdao.getCount();
	}
	
	int pageCount = (count + page_size - 1) / page_size;
	if (blockFinish > pageCount) {
		blockFinish = pageCount;
	}
	
	List<ReviewDto> list;
	if (isSearch) {
		list = revdao.search(review_pension_no, type, keyword, start, finish);
	}
	else {
		list = revdao.getList(review_pension_no, start, finish);
	}
	
	ReviewDao rdao = new ReviewDao();
%>

<jsp:include page="/template/nav.jsp"></jsp:include>
<style>
	a {
		text-decoration: none;
		display: block;
	}
	
 	textarea {
		resize: none;
	}
	.tdstyle{
		width: 38px;
	}
	.form-btn2,.form-btn3{
	    	width: 10%;
	        padding: 0.5rem;
	        outline: none;/*선택시 자동 부여되는 테두리 제거*/
	        border: none;
	    	border-radius: 5px;
	    }
	   
</style>

<article class = "w-70">
	<div class = "row-empty"></div>
	<div class = "row">
		<h1>리뷰</h1>
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
			<% for(ReviewDto revdto : list) { %>
			<tr>
				<td><%=revdto.getReview_no()%></td>
				
				<td class="left">
					<a href="review_detail.jsp?review_pension_no=<%= revdto.getReview_pension_no() %>&review_no=<%= revdto.getReview_no()%>">
						<%=revdto.getReview_title() %>
					</a>
				</td>
				
				<td>
					<%
						String review_id = revdao.getId(revdto.getReview_no());
						if (review_id != null) {%>
							<%= review_id %>
					<%} else {%>
						<font color="gray">XXX</font>
					<%} %>
				</td>
				<td><%= revdto.getReview_auto() %></td>
				<td><%= revdto.getReview_count() %></td>
			</tr>
			<% } %>
		</tbody>
	</table>
	<%if(rdao.getInfo(mdto.getMember_no(),review_pension_no) != null){ %>
	<div class="row right">
		<a href="write.jsp?review_pension_no=<%=review_pension_no%>">
			<input class="tdstyle form-btn3 form-inline" type="button" value="글쓰기">
		</a>
	</div>
	<%}%>
	<div class="row center pagination">
	
		<!-- 이전 -->
		<% if (blockStart > 1) { %>
			<%if (!isSearch) { %>
				<a href="review_list.jsp?review_pension_no=<%= review_pension_no %>&page=<%= blockStart - 1 %>">이전</a>
			<%} else { %>
				<a href="review_list.jsp?&review_pension_no=<%= review_pension_no %>page=<%= blockStart - 1 %>&type=<%= type %>&keyword=<%= keyword %>">이전</a>
			<%} %>
		<%} %>
		
		<% for (int i = blockStart; i <= blockFinish; i++) {%>
		
			<% if (!isSearch) { %>	
				<a href="review_list.jsp?review_pension_no=<%= review_pension_no %>&page=<%= i %>"><%= i %></a>
			<%} else { %>
				<a href="review_list.jsp?review_pension_no=<%= review_pension_no %>&page=<%= i %>&type=<%= type %>&keyword=<%= keyword %>"><%= i %></a>
			<%} %>
		<%} %>
		
		<!-- 다음 -->
		<% if (blockFinish < pageCount) { %>
			<%if (!isSearch) { %>
				<a href="review_list.jsp?review_pension_no=<%= review_pension_no %>&page=<%= blockFinish + 1 %>">다음</a>
			<%} else { %>
				<a href="review_list.jsp?review_pension_no=<%= review_pension_no %>&page=<%= blockFinish + 1 %>&type=<%= type %>&keyword=<%= keyword %>">다음</a>
			<%} %>
		<%} %>
		
	</div>
	
	
<!-- 검색창 -->
	<div class="row center">
		<form action="review_list.jsp?" method="get">
			<input type="hidden" name="review_pension_no" value="<%= review_pension_no %>">
			<select class="form-input form-inline" name="type">
				<option value="review_title">제목</option>
				<option value="review_writer">작성자</option>
			</select>
			
			<% if (keyword != null) { %>
				<input class="form-input form-inline" type="text" name="keyword" value="<%= keyword %>">
			<%} else {%>
				<input class="form-input form-inline" type="text" name="keyword">
			<%} %>
			
			<input class="tdstyle form-btn2 form-inline" type="submit" value="검색">
			
		</form>
	</div>	
		
		
	<div class="row-empty"></div>
	<div class="row-empty"></div>
	<div class="row-empty"></div>
	<div class="row-empty"></div>

</article>
<jsp:include page="/template/footer.jsp"></jsp:include>