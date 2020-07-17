<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="semi.beans.dto.PensionOptionDto"%>
<%@page import="semi.beans.dao.PensionOptionDao"%>
<%@page import="semi.beans.dto.PenImgViewDto"%>
<%@page import="semi.beans.dto.SellerDto"%>
<%@page import="semi.beans.dao.PensionDao"%>
<%@page import="semi.beans.dto.PensionDto"%>
<%@page import="java.util.List"%>
<jsp:include page = "/template/nav.jsp"></jsp:include>

<%
	//내가 보유하고 있는 펜션 목록을 출력
	SellerDto sdto = (SellerDto) request.getSession().getAttribute("sellerinfo");//로그인 된 판매자 정보
	int pension_seller_no = sdto.getSeller_no();//로그인 된 판매자의 번호
	PensionDao pdao = new PensionDao();
	PenImgViewDto viewDto = new PenImgViewDto();
	PensionOptionDao podao = new PensionOptionDao();
	
	String keyword = request.getParameter("keyword");
	boolean isSearch = keyword != null;
	
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

	List<PensionDto> list;//로그인 된 판매자 가진 펜션 목록 출력
	if(isSearch){
		list = pdao.search(pension_seller_no,keyword,start,finish);
	}else{
		list = pdao.getList(pension_seller_no,start,finish);
	}
	
	int count;
	if(isSearch){//검색이면
		count = pdao.getCount(keyword);
	}else{//목록이면
		count = pdao.getCount();
	}
	int pageCount = (count+pageSize-1)/pageSize;
	//만약 finishBlock 이 pageCount보다 크다면 수정해야 한다
	if(finishBlock>pageCount){
		finishBlock = pageCount;
	}

%>

<!-- 펜션 목록 리스트 -->
<style>
	
	
	a {
		text-decoration: none;
		color : black;
	}
	a:visited {
		color : gray;
	}
	a:hover{
		font-weight: bold;
	}
	.tdstyle{
		width: 38px;
	}
	
	
</style>

<article class="w-75">
	<div class="row">
		<!-- 제목 -->
		<h2>펜션 목록</h2>
	</div>
	<div class="row right">
	<form action="pension_list.jsp?keyword=<%=keyword %>" method="get">
		<input type="text" placeholder="펜션 검색" name = "keyword" style="width: 124px; height: 34px; padding: 1rem;">
		<input class = "form-btn form-inline" type="button" value = "검색">
		<a href="pension_list.jsp">
			<input class = "form-btn form-inline" type="button" value = "전체목록">
		</a>
		<a href="pension_regist.jsp">
			<input class = "form-btn form-inline" type="button" value = "펜션 등록">
		</a>
	</form>
	</div>
	<!-- 펜션 목록 -->
	<div class="row list">
		<table class="table table-sideopen">
			<thead>
				<tr>
					<th>펜션 사진</th>
					<th>펜션 이름</th>
					<th>펜션 등록일</th>
					<th colspan="4">관리</th>
				</tr>
				
			</thead>
			<tbody>
				<%for(PensionDto pdto : list){ %>
				<tr>
					<%viewDto = pdao.getListWithImg(pdto.getPension_no());
					if(viewDto != null){ %>
					<td rowspan="2"><img src="download.do?pen_image_no=<%=viewDto.getPen_img_no() %>" width="200" height="200"></td>
					<%}else{ %>
					<td rowspan="2"><img src="https://placehold.it/200x200"></td>
					<%} %>
					<td><%=pdto.getPension_name() %></td>
					<td><%=pdto.getPension_regist_date_day() %></td>
					<td class="tdstyle"><a href="pension_detail.jsp?pension_no=<%=pdto.getPension_no()%>"><input class = "form-btn form-inline" type="button" value="상세보기"></a></td>
					<td class="tdstyle"><a href = "<%=request.getContextPath() %>/seller/password_check.jsp?go=pension_delete.do?pension_no=<%=pdto.getPension_no()%>"><input class = "form-btn form-inline" type="button" value="펜션삭제"></a></td>
					<td class="tdstyle"><a href="room_list.jsp?pension_no=<%=pdto.getPension_no()%>"><input class = "form-btn form-inline" type="button" value="객실목록"></a></td>
					<td class="tdstyle"><a href="room_regist.jsp?pension_no=<%= pdto.getPension_no()%>"><input class = "form-btn form-inline" type="button" value="객실등록"></a></td>
				</tr>
				
				<!-- 옵션에 따른 아이콘  표시 -->
				<tr><td colspan="6" height="50px"  class="left">
					<%
					List<PensionOptionDto> optionList = podao.getList(pdto.getPension_no());
					for(PensionOptionDto podto : optionList){
						if(podto.getOption_name().equals("수영장")){%>
						<img alt="수영장" src="<%=request.getContextPath()%>/image/swim.png" style="height: 30px; width: 40px; display: inline;">&nbsp;&nbsp;
						<%}else if(podto.getOption_name().equals("공용 바베큐장")){ %>
						<img alt ="공용 바베큐장" src="<%=request.getContextPath()%>/image/bbq.png" style="height: 30px; width: 40px; display: inline">&nbsp;&nbsp;
						<%}else if(podto.getOption_name().equals("노래방")){ %>
						<img alt ="노래방" src="<%=request.getContextPath()%>/image/sing.png" style="height: 30px; width: 40px; display: inline">&nbsp;&nbsp;
						<%}else if(podto.getOption_name().equals("족구장")){ %>
						<img alt ="족구장" src="<%=request.getContextPath()%>/image/foot.png" style="height: 30px; width: 40px;display: inline">&nbsp;&nbsp;
						<%}else if(podto.getOption_name().equals("탁구장")){ %>
						<img alt ="탁구장" src="<%=request.getContextPath()%>/image/tak.png" style="height: 30px; width: 40px; display: inline">&nbsp;&nbsp;
						<%}else if(podto.getOption_name().equals("반려견")){ %>
						<img alt ="반려견" src="<%=request.getContextPath()%>/image/dog.png" style="height: 30px; width: 40px; display: inline">&nbsp;&nbsp;
						<%} %>
					<%} %>
				</td></tr>
				<%} %>
			</tbody>
		</table>
	<div class="row-empty"></div>
	<!-- 펜션 등록 버튼 -->
	<div class="row right">
		<a href="pension_regist.jsp">
			<input class = "form-btn form-inline" type="button" value = "펜션 등록">
		</a>
	</div>
	<div class="row-empty"></div>
	<div class="row-empty"></div>
	<div class="row center pagination">
	<%if(startBlock>1){ %>
		<%if(!isSearch){ %>
			<a href = "pension_list.jsp?page=<%=startBlock-1%>">&lt;</a>
		<%}else{ %>
			<a href = "pension_list.jsp?page=<%=startBlock-1%>&keyword=<%=keyword%>">
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
					
		<%if(!isSearch){ %>
			<a href = "pension_list.jsp?page=<%=i%>"<%=prop%>><%=i%></a>
		<%}else{ %>
			<a href = "pension_list.jsp?page=<%=i %>&keyword=<%=keyword %>"<%=prop%>><%=i %></a>
	<%} %>
	<%} %>
	<%if(pageCount>finishBlock){ %>
		<%if(!isSearch){ %>
			<a href = "pension_list.jsp?page=<%=finishBlock+1%>">&gt;</a>
		<%}else{ %>
			<a href = "pension_list.jsp?page=<%=startBlock-1%>&keyword=<%=keyword%>">
			&gt;</a>
		<%} %>
		<%} %>
	</div>
	</div>
</article>
<jsp:include page = "/template/footer.jsp"></jsp:include>