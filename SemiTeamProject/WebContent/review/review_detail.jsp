<%@page import="semi.beans.dao.ReviewFileDao"%>
<%@page import="semi.beans.dto.ReviewFileDto"%>
<%@page import="semi.beans.dao.ReviewDao"%>
<%@page import="semi.beans.dao.MemberDao"%>
<%@page import="semi.beans.dto.MemberDto"%>
<%@page import="semi.beans.dto.ReviewReplyDto"%>
<%@page import="semi.beans.dto.ReviewDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%
   	ReviewDto revdto = new ReviewDto();
   	ReviewReplyDto rrdto = new ReviewReplyDto();
   	ReviewFileDto rfdto = new ReviewFileDto();
   	ReviewFileDao rfdao = new ReviewFileDao();
  	MemberDto mdto = (MemberDto) session.getAttribute("userinfo");
   	int review_no = Integer.parseInt(request.getParameter("review_no"));
   	int review_pension_no = Integer.parseInt(request.getParameter("review_pension_no"));
   	ReviewDao revdao = new ReviewDao();
   	
   	revdto = revdao.get(review_no);
   	
   %> 
<jsp:include page="/template/nav.jsp"></jsp:include>
<article class="w-50">
<div class="row">
		<h2>리뷰 상세 보기</h2>
	</div>	
	
	<div class="row">
	
		<font size="5">
			
			<%= revdto.getReview_title() %>
		</font>
	</div>
	
	<div class="row">
		<font size="5">
			<% if (revdto.getReview_writer() != 0) {%>
				<%= revdto.getReview_writer() %>
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
	<div class="row center">
		<%rfdto = rfdao.getImgView(rfdto.getReview_origin()); 
					if(rfdto != null){%>
  					<img src="filedownload.do?review_file_no=<%=rfdto.getReview_file_no() %>" width="250" height="250">
   					<%}else{ %>
					<img src="https://placehold.it/250x250">
					<%} %>
	
	</div>
	<div class="row" style="min-height: 300px">
		<%= revdto.getReview_content() %>
	</div>
	
	<div class="row-empty">
		<hr>
	</div>
	<% if ( rrdto.getReply_writer() != 0 ) { %>
		<div class="row">
			<h4 class="left">관리자</h4>
			<%= rrdto.getReply_writer() %>
		</div>
	<%} %> 
	<div class="row-empty"></div>
	<div class="row right">
		<%if(revdto.getReview_writer()!=0){ %>
		<a href="review_delete.do?review_pension_no<%=review_pension_no%>&review_no=<%=review_no%>">
			<input class="form-btn form-inline" type="button" value="리뷰삭제">
		</a>
		<a href="review_edit.jsp?review_pension_no=<%=review_pension_no%>&review_no=<%=review_no%>">
			<input class="form-btn form-inline" type="button" value="리뷰수정">
		</a>
		<%} %>
		<a href="review_list.jsp?review_pension_no=<%=review_pension_no%>">
			<input class="form-btn form-inline" type="button" value="목록">
		</a>
	</div>
	</article>
<jsp:include page="/template/footer.jsp"></jsp:include>