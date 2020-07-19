<%@page import="semi.beans.dto.ReservationDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.dto.AdminDto"%>
<%@page import="semi.beans.dao.ReviewFileDao"%>
<%@page import="semi.beans.dto.ReviewFileDto"%>
<%@page import="semi.beans.dao.ReviewDao"%>
<%@page import="semi.beans.dao.MemberDao"%>
<%@page import="semi.beans.dto.MemberDto"%>
<%@page import="semi.beans.dto.ReviewReplyDto"%>
<%@page import="semi.beans.dao.ReviewReplyDao"%>
<%@page import="semi.beans.dto.ReviewDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%
   	AdminDto adto = (AdminDto) session.getAttribute("admininfo");
   	MemberDto mdto = (MemberDto) session.getAttribute("userinfo");
   	ReviewDto revdto = new ReviewDto();
   	ReviewFileDto rfdto = new ReviewFileDto();

   	int review_pension_no = Integer.parseInt(request.getParameter("review_pension_no"));
   	int review_no = Integer.parseInt(request.getParameter("review_no"));
   	ReviewDao revdao = new ReviewDao();
   	revdto = revdao.get(review_no);
   	ReviewFileDao rfdao = new ReviewFileDao();
   	ReviewReplyDao rrdao = new ReviewReplyDao();
   	
	boolean isAdmin = (adto != null);
	
	// - 내글 : 게시글(revdto)의 작성자와 로그인 된 사용자(user)의 아이디가 같아야 함
	boolean isMine = mdto.getMember_no()==(revdto.getReview_writer());
	List<ReviewReplyDto> replyList = rrdao.getList(review_no);
	
	List<ReviewFileDto> fileList = rfdao.getList(review_no);
	ReservationDto rvdto = new ReservationDto();
   %> 
<jsp:include page="/template/nav.jsp"></jsp:include>
<input type="hidden" name="review_res_no" value="<%=rvdto.getRes_no()%>">
<style>
	a {
		text-decoration: none;
	}
	.tdstyle{
		width: 38px;
	}
.form-btn2,.form-btn3{
	    	width: 50%;
	        padding: 0.5rem;
	        outline: none;/*선택시 자동 부여되는 테두리 제거*/
	        border: none;
	    	border-radius: 5px;
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
			<%
			String review_id = revdao.getId(revdto.getReview_no());
			if (review_id != null) {%>
			<%= review_id %>
		<%}  else {%>
		<font color="gray">XXX</font>
					<%} %>
		</font>
	</div>
	
	<div class="row">
		<%= revdto.getReview_auto() %> / 
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
						<%
						String reply_id = rrdao.getReplyId(rrdto.getReply_no());
						if(reply_id != null){ %> 
						<%=reply_id%> 
							<!-- 게시글 작성자인 경우 추가로 표시 -->
									<%
// 										boolean isWriter = 게시글작성자 존재 && 댓글작성자 존재 && 두 작성자 일치;
										boolean isWriter = review_id != null;
										isWriter = isWriter && reply_id != null;
										isWriter = isWriter && review_id.equals(reply_id);
										if(isWriter){
									%>
										<font color="red">(작성자)</font>
									<%} %>
								
						</div>
						<div class="row"><%=rrdto.getReply_content()%></div>
						<div class="row"><%=rrdto.getReply_auto()%></div>
							<!-- 
								수정 삭제 버튼은 "내 댓글" 이거나 "관리자" 인 경우만 표시
							 -->
							<%
// 								boolean isMyReply = 내 아이디가 작성자와 같은 경우;
								boolean isMyReply = review_id.equals(reply_id);
								if(isAdmin || isMyReply){
							%>
						<div class="row right">
						<a href="reply_edit.do?reply_no=<%=rrdto.getReply_no()%>&reply_origin=<%=review_no %>">
							<input class="tdstyle form-btn3 form-inline" type="button" value="수정">
						</a>
						<a href="reply_delete.do?reply_no=<%=rrdto.getReply_no()%>&reply_origin=<%=review_no%>">
							<input class="tdstyle form-btn3 form-inline" type="button" value="삭제">
						</a>
					</div>
						<%} %>
					<%} %>
			</div>
			<%} %>
			
			<!-- 댓글 작성 영역 -->
	
				<div align="right" >
					<form action="reply_insert.do" method="post">
						<input type="hidden" name="reply_origin" value="<%=review_no%>">
						<input type="hidden" name="review_pension_no" value="<%= review_pension_no %>">
						<textarea name="reply_content" rows="4" cols="92" placeholder="댓글 작성"></textarea>
							<input class="tdstyle form-btn3 form-inline" type="submit" value="댓글등록">	
						<br>
					</form>
				</div>
		

	<div class="row-empty"></div>
	<div class="row right">
		<%if(revdto.getReview_writer()!=0){ %>
		<a href="review_delete.do?review_pension_no<%=review_pension_no%>&review_no=<%=review_no%>">
			<input class="tdstyle form-btn2 form-inline" type="button" value="리뷰삭제">
		</a>
		<a href="review_edit.jsp?review_pension_no=<%=review_pension_no%>&review_no=<%=review_no%>">
			<input class="tdstyle  form-btn2 form-inline" type="button" value="리뷰수정">
		</a>
		<%} %>
		<a href="review_list.jsp?review_pension_no=<%=review_pension_no%>">
			<input class="tdstyle form-btn2 form-inline" type="button" value="펜션목록">
		</a>
	</div>
	</article>
<jsp:include page="/template/footer.jsp"></jsp:include>