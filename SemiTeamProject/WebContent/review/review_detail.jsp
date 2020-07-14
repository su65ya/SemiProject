<%@page import="semi.beans.dto.MemberDto"%>
<%@page import="semi.beans.dto.ReviewDto"%>
<%@page import="semi.beans.dao.ReviewDao"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="semi.beans.dto.SellerDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
    	int review_no = Integer.parseInt(request.getParameter("review_no"));
    	int review_pension_no = Integer.parseInt(request.getParameter("review_pension_no"));
    	
    	SellerDto sdto = (SellerDto) session.getAttribute("sellerinfo");
    
    //////////////////////////////////////////////////////////////////////////////////
    
	    Set<Integer> memory  = (Set<Integer>) session.getAttribute("memory");
	
	    if (memory ==null) {
			memory = new HashSet<>();    	
	    }
	    
	    boolean isCount = memory.add(review_no);
	    
	    session.setAttribute("memory", memory);
	    
	    ReviewDao revdao = new ReviewDao();
		ReviewDto revdto = revdao.get(review_no);	    
    	
		
	    MemberDto user = (MemberDto) session.getAttribute("userinfo");
	    
	    if (user != null) {
		    if (isCount) {
		    	revdao.viewCount(review_no, user.getMember_no());
		    }
	    }
    	
	    boolean isUser = user.getMember_no() == revdto.getReview_writer();
    	
    %>    
    
<jsp:include page="/template/nav.jsp"></jsp:include>
<article class="w-50">
	<div class="row">
		<h2>리뷰 상세 보기</h2>
	</div>
	<div class="row">
		<table class="table table-sideopen"></table>
			<tbody>
				<tr>
					<th>리뷰제목</th>
					<
					<th>작성자</th>
					<th>
			</tbody>
	
	</div>
</article>
<jsp:include page="/template/footer.jsp"></jsp:include>
<div class="row">
		<font size="5">
			<% if (revdto.getReview_writer() != 0) {%>
				<%= user.getMember_id() %>
			<%} else {%>
				<font color="gray">XXX</font>
			<%} %>
		</font>
	</div>
	
	<div class="row">
		<%= revdto.getReview_date() %> / 
		<%= revdto.getReview_count() %>
	</div>
	
	<div class="row-empty">
		<hr>
	</div>
	
	<div class="row" style="min-height: 300px">
		<%= revdto.getReview_content() %>
	</div>
	
	<div class="row-empty">
		<hr>
	</div>
	
	<% if ( revdto.getReview_reply() != null ) { %>
		<div class="row">
			<h4 class="left">관리자</h4>
			<%= revdto.getReview_reply() %>
		</div>
	<%} %>
	
	<div class="row-empty"></div>

	<div class="row right">
		<% if (sdto == null && isUser) { %>
			<a href="review_edit.jsp?review_no=<%= review_no %>">
				<input class="form-btn form-inline" type="button" value="리뷰수정">
			</a>
		<%} %>
		<% if(isUser) { %>
			<a href="review_delete.do?review_pension_no=<%= review_pension_no %>&review_no=<%= review_no %>">
				<input class="form-btn form-inline" type="button" value="삭제">
			</a>
		<%} %>
		<a href="write.jsp">
			<input class="form-btn form-inline" type="button" value="글쓰기">
		</a>
		<% if (sdto != null) {%>	
			<% if (revdto.getReview_reply() != null) { %>
				<a href="review_reply.jsp?review_pension_no=<%= review_pension_no %>&review_no=<%= review_no %>">
					<input class="form-btn form-inline" type="button" value="댓글수정">
				</a>
			<%} else {%>
				<a href="review_reply.jsp?review_pension_no=<%= review_pension_no %>&review_no=<%= review_no %>">
					<input class="form-btn form-inline" type="button" value="댓글달기">
				</a>
				<%} %>
		<%} %>
		<a href="review_list.jsp?review_pension_no=<%=review_pension_no %>">
			<input class="form-btn form-inline" type="button" value="리뷰목록">
		</a>
	</div>
	

</article>