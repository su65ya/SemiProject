<%@page import="java.util.ArrayList"%>
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
		
	
// 	int member_no = 3;
	PensionDao pdao = new PensionDao();
	PenImgViewDto viewDto = new PenImgViewDto();
	PensionOptionDao podao = new PensionOptionDao();
	String location = request.getParameter("location");
	String res_in = request.getParameter("start_date");
	String res_out = request.getParameter("finish_date");
	String people_str = request.getParameter("person");
	int people;
	if(people_str == null){
		people = 0;
	}else{
		people = Integer.parseInt(request.getParameter("person"));
	}

	boolean isLiveSearch = location != null && res_in != null && res_out != null;
	
	boolean isSearch = location != null;
	int pageSize = 5;
	String pageStr = request.getParameter("page");
	
	int pageNo;
	try{
		pageNo = Integer.parseInt(pageStr);
		if(pageNo <= 0){
			throw new Exception();
		}
	}catch(Exception e){
		pageNo = 1;
	}
	int finish = pageNo * pageSize;
	int start = finish - (pageSize-1); 
	int blockSize = 10;
	int startBlock = (pageNo-1)/blockSize*blockSize+1;
	int finishBlock = startBlock + (blockSize-1);
	int count;
	if(isSearch){//검색이면
		count = pdao.getCount(location);
	}else{//목록이면
		count = pdao.getCount();
	}
	int pageCount = (count+pageSize-1)/pageSize;
	//만약 finishBlock 이 pageCount보다 크다면 수정해야 한다
	if(finishBlock>pageCount){
		finishBlock = pageCount;
	}
	
	
	List<PensionDto> list = pdao.getList(start,finish);
	if(isLiveSearch){
		list = pdao.getLiveSearch(res_in, res_out,location, people, start, finish);
		if(list.isEmpty()){
		list = pdao.getList(start,finish);
		}
	}else{
		list = pdao.getList(start,finish);
	}
%>

<jsp:include page="/template/nav.jsp"></jsp:include>

<style>
		.form-input,.form-btn2,.form-btn3{
	    	width: 50%;
	        padding: 0.5rem;
	        outline: none;/*선택시 자동 부여되는 테두리 제거*/
	        border: none;
	    	border-radius: 5px;
	    }
		.form-btn2{
	        background-color:#636e72;
	        width : 80px;
	        color: white;
	    	cursor: pointer;
	    }
	    .form-btn3{
	        background-color:#ff7675;
	        width : 80px;
	        color: white;
	        cursor: pointer;
	    }
</style>
<article class="w-90">
<div class="row">
	<jsp:include page="/template/Search.jsp"></jsp:include>
	</div>
	
	<div class="row-empty"></div>
	<div class="row-empty"></div>
	<!-- 펜션 목록 -->
	<div class="row list ">
	<div class="float-box" style="align-content: right !important; float: right;"><a href="pension_list.jsp"> <button class="form-btn2" style=" width: 150px; margin-bottom: 30px; background-color: #795548; color: white; height: 40px; outline-color: #795548;">전체 목록</button></a></div>
	<div class="row-empty"></div>
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
						<a href="room_list.jsp?pension_no=<%=pdto.getPension_no()%>"><button type ="button" class='form-btn2 form-inline'>객실보기</button></a>
						<a href="reservation_step1.do?pension_no=<%=pdto.getPension_no()%>"><button class='form-btn3 form-inline'>예약하기</button></a>
						<a href="<%= request.getContextPath() %>/review/review_list.jsp?review_pension_no=<%= pdto.getPension_no()%>"><button class='form-btn2 form-inline'>리뷰보기</button></a>
						<a href='<%= request.getContextPath() %>/question/question_list.jsp?que_pension_no=<%= pdto.getPension_no()%>'><button type ="button" class='form-btn2 form-inline'>문의하기</button></a>
						
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
		
		<div class="row center pagination">
		<div class="row-empty"></div>
		<div class="row-empty"></div>
		<div class="row-empty"></div>
	<%if(startBlock>1){ %>
		<%if(!isLiveSearch){ %>
			<a href = "pension_list.jsp?page=<%=startBlock-1%>">&lt;</a>
		<%}else{ %>
			<a href = "pension_list.jsp?page=<%=startBlock-1%>&location=<%=location%>&start_date=<%=res_in%>&finish_date=<%=res_out%>&person=<%=people%>">
			&lt;</a>
		<%} %>
		
	<%} %>
	<%for(int i = startBlock;i<=finishBlock;i++){ %>
		<%
		//현재 페이지에 해당하는 블록은 class="on"을 출력하면 디자인 효과를 볼 수 있다
			String prop;
			if(i == pageNo){//현재페이지 번호면
				prop = "class='on'";
				}else{//아니면
					prop="";
				}
		%>
					
		<%if(!isLiveSearch){ %>
			<a href = "pension_list.jsp?page=<%=i%>"<%=prop%>><%=i%></a>
		<%}else{ %>
			<a href = "pension_list.jsp?page=<%=i %>&keyword=<%=location %>&start_date=<%=res_in%>&finish_date=<%=res_out%>&person=<%=people%>"<%=prop%>><%=i %></a>
	<%} %>
	<%} %>
	<%if(pageCount>finishBlock){ %>
		<%if(!isLiveSearch){ %>
			<a href = "pension_list.jsp?page=<%=finishBlock+1%>">&gt;</a>
		<%}else{ %>
			<a href = "pension_list.jsp?page=<%=startBlock-1%>&location=<%=location%>&start_date=<%=res_in%>&finish_date=<%=res_out%>&person=<%=people%>">
			&gt;</a>
		<%} %>
		<%} %>
	</div>
		</div>
</article>
<jsp:include page="/template/footer.jsp"></jsp:include>