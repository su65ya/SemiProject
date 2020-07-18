<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
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
   	String memberId = revdao.getId(review_no);
   	
   	
	boolean isAdmin = (adto != null);
	
	// - 내글 : 게시글(bdto)의 작성자와 로그인 된 사용자(user)의 아이디가 같아야 함
	List<ReviewReplyDto> replyList = rrdao.getList(review_no);
	
	List<ReviewFileDto> fileList = rfdao.getList(review_no);
	 //////////////////////////////////////////////////////////////////////////////////
    
    Set<Integer> memory  = (Set<Integer>) session.getAttribute("memory");

    if (memory ==null) {
		memory = new HashSet<>();    	
    }
    
    boolean isCount = memory.add(review_no);
    
    session.setAttribute("memory", memory);   
	
    
    if (mdto != null) {
	    if (isCount) {
	    	revdao.viewCount(review_no, mdto.getMember_no());
	    }
    }
	
    
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
		<%
			String member_id = revdao.getId(revdto.getReview_no());
			if (member_id != null) {%>
				<%=member_id %>
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
	<hr>
	<!-- 댓글 목록 영역 -->
	<%if(!replyList.isEmpty()){ %>
			<div class="row-center">
				<%for(ReviewReplyDto rrdto : replyList){ %>
					<div style="width:85%;"> 
					<% 
					String memberid = rrdao.getId(rrdto.getReply_no());
					if (memberid!=null) {%>
						<%=memberid %>					                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
					<%} else {%>
						<font color="red">탈퇴한 사용자</font>
						<%} %>
							<!-- 게시글 작성자인 경우 추가로 표시 -->
									<%
// 										boolean isWriter = 게시글작성자 존재 && 댓글작성자 존재 && 두 작성자 일치;
										
										boolean isWriter = member_id != null;
										isWriter = isWriter && memberid != null;
										isWriter = isWriter && member_id.equals(memberid);
										if(isWriter){
									%>
										<font color="red">(작성자)</font>
									<%} %>
						</div>
						<div class="row">
							<%= rrdto.getReply_content() %>
						</div>
						<div class="row"><%=rrdto.getReply_date()%></div>
					
						<div class="row right">
							<%
// 								boolean isMyReply = 내 아이디가 작성자와 같은 경우;
								boolean isMyReply = mdto.getMember_no()==(rrdto.getReply_writer());
								if(isAdmin || isMyReply){
							%>
							
<!-- 						<form action="reply_edit.do" method="post"> -->
<%-- 							<textarea class="onon" name="reply_content" rows="4" cols="92"<%=rrdto.getReply_content() %>></textarea> --%>
<!-- 							<input class="form-btn form-inline" type="submit" value="수정"> -->
<!-- 						</form> -->
						<a href="reply_delete.do?&reply_no=<%=rrdto.getReply_no()%>&reply_origin=<%=rrdto.getReply_origin()%>&review_pension_no=<%=review_pension_no %>">
							<input class="form-btn3 form-inline" type="button" value="삭제">
						</a>
						<%} %>
						</div>
							<hr>						
				<%} %>
				</div>
				
			<%} %>
					

			<!-- 댓글 작성 영역 -->
				<form action="reply_insert.do" method="post">
					<div class="row">
						<input type="hidden" name="reply_origin" value="<%=review_no%>">
						<input type="hidden" name="review_pension_no" value="<%= review_pension_no %>">
						<textarea class="form-input3" name="reply_content" rows="4" cols="80" placeholder="댓글 작성"></textarea>
					</div>
					<div class="row right">
						<input class="form-btn form-inline" type="submit" value="등록">
					</div>
				</form>
		

	<div class="row-empty"></div>
	<div class="row right">
		<%if(revdto.getReview_writer()!=0){ %>
		<a href="review_delete.do?review_pension_no<%=review_pension_no%>&review_no=<%=review_no%>">
			<input class="form-btn2 form-inline" type="button" value="리뷰삭제">
		</a>
		<a href="review_edit.jsp?review_pension_no=<%=review_pension_no%>&review_no=<%=review_no%>">
			<input class="form-btn2 form-inline" type="button" value="리뷰수정">
		</a>
		<%} %>
		<a href="review_list.jsp?review_pension_no=<%=review_pension_no%>">
			<input class="form-btn2 form-inline" type="button" value="목록">
		</a>
	</div>
	</article>
<jsp:include page="/template/footer.jsp"></jsp:include>