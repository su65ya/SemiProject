<%@page import="semi.beans.dao.ReviewReplyDao"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.dto.AdminDto"%>
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
   	AdminDto adto = (AdminDto) session.getAttribute("admininfo");
   	MemberDto mdto = (MemberDto) session.getAttribute("userinfo");
   	ReviewDto revdto = new ReviewDto();
   	ReviewFileDto rfdto = new ReviewFileDto();

   	ReviewReplyDao rrdao = new ReviewReplyDao();
   	int review_pension_no = Integer.parseInt(request.getParameter("review_pension_no"));
   	int review_no = Integer.parseInt(request.getParameter("review_no"));
   	ReviewDao revdao = new ReviewDao();
   	revdto = revdao.get(review_no);
   	ReviewFileDao rfdao = new ReviewFileDao();
   	
   	
   	
	boolean isAdmin = (adto != null);
	
	// - 내글 : 게시글(bdto)의 작성자와 로그인 된 사용자(user)의 아이디가 같아야 함
	boolean isMine = mdto.getMember_no()==(revdto.getReview_writer());
	List<ReviewReplyDto> replyList = rrdao.getList(review_no);
	
	List<ReviewFileDto> fileList = rfdao.getList(review_no);
	
   %> 
<jsp:include page="/template/nav.jsp"></jsp:include>

<style>
	a {
		text-decoration: none;
	}

</style>

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
		조회 <%= revdto.getReview_count() %>
	</div>
	
	<div class="row-empty">
		<hr>
	</div>
	<%if(!fileList.isEmpty()){%>
	<div class="row center">
		<%rfdto = rfdao.getImgView(review_no); 
					if(rfdto != null){%>
  					<img src="filedownload.do?review_file_no=<%=rfdto.getReview_file_no() %>" width="250" height="250">
   					<%}else{ %>
					<img src="https://placehold.it/250x250">
					<%} %>
	</div>
	<%} %>
	<div class="row" style="min-height: 300px">
		<%= revdto.getReview_content() %>
	</div>
	
	<div class="row-empty">
		<hr>
	</div>
	
	<!-- 댓글 목록 영역 -->
			<div class="row row-center">
				<%for(ReviewReplyDto rrdto : replyList){ %>
						<div class="row">
							<%=mdto.getMember_id()%>
							<!-- 게시글 작성자인 경우 추가로 표시 -->
									<%
// 										boolean isWriter = 게시글작성자 존재 && 댓글작성자 존재 && 두 작성자 일치;
										boolean isWriter = revdto.getReview_writer() != 0;
										isWriter = isWriter && rrdto.getReply_writer() != 0;
										isWriter = isWriter && revdto.getReview_writer()==(rrdto.getReply_writer());
										if(isWriter){
									%>
										<font color="red">(작성자)</font>
									<%} %>
						</div>
						<div class="row"><%=rrdto.getReply_content()%></div>
						<div class="row"><%=rrdto.getReply_date()%></div>
							<!-- 
								수정 삭제 버튼은 "내 댓글" 이거나 "관리자" 인 경우만 표시
							 -->
							<%
// 								boolean isMyReply = 내 아이디가 작성자와 같은 경우;
								boolean isMyReply = mdto.getMember_no()==(rrdto.getReply_writer());
								if(isAdmin || isMyReply){
							%>
						<div class="row right">
						<a href="reply_edit.do?reply_no=<%=rrdto.getReply_no()%>&reply_origin=<%=review_no %>">
							<input class="form-btn form-inline" type="button" value="수정">
						</a>
						<a href="reply_delete.do?reply_no=<%=rrdto.getReply_no()%>&reply_origin=<%=review_no%>">
							<input class="form-btn form-inline" type="button" value="삭제">
						</a>
					</div>
						<%} %>
					<%} %>
			</div>
			
			<!-- 댓글 작성 영역 -->
	
				<div align="right" >
					<form action="reply_insert.do" method="post">
						<input type="hidden" name="reply_origin" value="<%=review_no%>">
						<input type="hidden" name="review_pension_no" value="<%= review_pension_no %>">
						<textarea name="reply_content" rows="4" cols="92" placeholder="댓글 작성"></textarea>
							<input class="form-btn form-inline" type="submit" value="댓글등록">	
						<br>
					</form>
				</div>
		

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