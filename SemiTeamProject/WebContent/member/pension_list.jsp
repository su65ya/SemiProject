<%@page import="semi.beans.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="semi.beans.dto.PensionOptionDto"%>
<%@page import="semi.beans.dao.PensionOptionDao"%>
<%@page import="semi.beans.dto.PenImgViewDto"%>
<%@page import="semi.beans.dto.SellerDto"%>
<%@page import="semi.beans.dao.PensionDao"%>
<%@page import="semi.beans.dto.PensionDto"%>
<%@page import="java.util.List"%>
<%
	MemberDto mdto = (MemberDto)session.getAttribute("userinfo");
	int member_no = mdto.getMember_no();
	PensionDao pdao = new PensionDao();
	PenImgViewDto viewDto = new PenImgViewDto();
	PensionOptionDao podao = new PensionOptionDao();
	String location = request.getParameter("location");
	List<PensionDto> list;;
	if(location !=null){
		list = pdao.getList(location);
	}else{
		list = pdao.getList();
	}
%>

<jsp:include page="/template/nav.jsp"></jsp:include>
<article class="w-90">
<div class="row">
	<jsp:include page="/template/Search.jsp"></jsp:include>
	</div>
	
	<div class="row-empty"></div>
	<div class="row-empty"></div>
	<!-- 펜션 목록 -->
	<div class="row list ">
		<table class="table table-sideopen left" style=border-collapse:inherit;>
			<tbody>
				<%for (PensionDto pdto : list) {%>
				<tr>
					<%
						viewDto = pdao.getListWithImg(pdto.getPension_no());
							if (viewDto != null) {
					%>
					<td rowspan="3" style=width:30px;>
					<img src="download.do?pen_image_no=<%=viewDto.getPen_img_no() %>" width="200" height="200"></td>
					<%} else { %>
					<td rowspan="3"><img src="https://placehold.it/200x200"></td>
					<%}%>
					<td height="10px" style=""><h2 class="left" style="height: 10px;"><%=pdto.getPension_name()%></h2></td>
					<td rowspan="3">
						<a href="room_list.jsp?pension_no=<%=pdto.getPension_no()%>"><button type ="button" class='form-btn form-inline'>객실보기</button></a>
							<a href="reservation_step1.do?pension_no=<%=pdto.getPension_no()%>&member_no=<%=member_no%>"><button class='form-btn form-inline'>예약하기</button></a>
						<a href="<%= request.getContextPath() %>/review/review_list.jsp?review_pension_no=<%= pdto.getPension_no()%>"><button class='form-btn form-inline'>리뷰보기</button></a>
						<a href='<%= request.getContextPath() %>/question/question_list.jsp?que_pension_no=<%= pdto.getPension_no()%>'><button type ="button" class='form-btn form-inline'>문의하기</button></a>
						
					</td>
				</tr>
				<tr>
					<td class="left"><h5 class="left" style="color: gray;" ><%=pdto.getPension_basic_addr() %></h5></td>
				</tr>
				<!-- 옵션에 따른 아이콘  표시 -->
				<tr>
					<td colspan="3" height="50px" class="left">
						<%
							List<PensionOptionDto> optionList = podao.getList(pdto.getPension_no());
								for (PensionOptionDto podto : optionList) {
									if (podto.getOption_name().equals("수영장")) {
						%> <img alt="수영장"
						src="<%=request.getContextPath()%>/image/swim.png"
						style="height: 30px; width: 40px; display: inline-block;">&nbsp;&nbsp;
						<%
							} else if (podto.getOption_name().equals("공용 바베큐장")) {
						%> <img
						alt="공용 바베큐장" src="<%=request.getContextPath()%>/image/bbq.png"
						style="height: 30px; width: 40px; display: inline-block;">&nbsp;&nbsp;
						<%
							} else if (podto.getOption_name().equals("노래방")) {
						%> <img alt="노래방"
						src="<%=request.getContextPath()%>/image/sing.png"
						style="height: 30px; width: 40px; display: inline-block;">&nbsp;&nbsp;
						<%
							} else if (podto.getOption_name().equals("족구장")) {
						%> <img alt="족구장"
						src="<%=request.getContextPath()%>/image/foot.png"
						style="height: 30px; width: 40px; display: inline">&nbsp;&nbsp;
						<%
							} else if (podto.getOption_name().equals("탁구장")) {
						%> <img alt="탁구장"
						src="<%=request.getContextPath()%>/image/tak.png"
						style="height: 30px; width: 40px; display: inline">&nbsp;&nbsp;
						<%
							} else if (podto.getOption_name().equals("반려견")) {
						%> <img alt="반려견"
						src="<%=request.getContextPath()%>/image/dog.png"
						style="height: 30px; width: 40px; display: inline">&nbsp;&nbsp;
						<% } %> 
						<% } %>
					</td>
				</tr>
				<tr>
					<td colspan="3"><hr></td>
				</tr>
				<%}%>
			</tbody>
		</table>
		</form>
		</div>
</article>
<jsp:include page="/template/footer.jsp"></jsp:include>