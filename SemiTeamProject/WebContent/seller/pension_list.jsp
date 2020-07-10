<%@page import="semi.beans.dto.SellerDto"%>
<%@page import="semi.beans.dao.PensionDao"%>
<%@page import="semi.beans.dto.PensionDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page = "/template/nav.jsp"></jsp:include>

<%

	//내가 보유하고 있는 펜션 목록을 출력
	SellerDto sdto = (SellerDto) request.getSession().getAttribute("sellerinfo");//로그인 된 판매자 정보
	int pension_seller_no = sdto.getSeller_no();//로그인 된 판매자의 번호
	PensionDao pdao = new PensionDao();
	List<PensionDto> list = pdao.getList(pension_seller_no);//로그인 된 판매자 가진 펜션 목록 출력
	
%>
<!-- 펜션 목록 리스트 -->
<article class="w-60">
	<div class="row">
		<!-- 제목 -->
		<h2>펜션 목록</h2>
	</div>
	<!-- 펜션 목록 -->
	<div class="row list">
		<table class="table table-sideopen">
			<thead>
				<tr>
					<th>펜션 사진</th>
					<th>펜션 번호</th>
					<th>펜션 이름</th>
					<th>펜션 등록일</th>
					<th colspan="3">관리</th>
				</tr>
			</thead>
			<tbody>
				<%for(PensionDto pdto : list){ %>
				<tr>
					<td>사진사진</td>
					<td><%=pdto.getPension_no() %></td>
					<td><%=pdto.getPension_name() %></td>
					<td><%=pdto.getPension_regist_date_day() %></td>
					<td><a href="pension_detail.jsp?pension_no=<%=pdto.getPension_no()%>">상세보기</a></td>
					<td><a href="room_list.jsp?pension_no=<%=pdto.getPension_no()%>">객실목록</a></td>
					<td><a href="room_regist.jsp?pension_no=<%= pdto.getPension_no()%>">객실등록</a></td>
				</tr>
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
	</div>
	<!-- 네비게이터 -->
<!-- 		<div class="row center pagination"> -->
<!-- 		<!--  -->
<!-- 			이전 버튼을 누르면 startBlock - 1 에 해당하는 페이지로 이동해야 한다 -->
<!-- 			(주의) startBlock이 1인 경우에는 출력하지 않는다 -->
<!-- 		 --> -->
<%-- 		<%if(startBlock > 1){ %> --%>
		
<%-- 			<%if(!isSearch){ %>  --%>
<%-- 				<a href="list.jsp?page=<%=startBlock-1%>">&lt;</a> --%>
<%-- 			<%}else{ %> --%>
<%-- 				<a href="list.jsp?page=<%=startBlock-1%>&type=<%=type%>&keyword=<%=keyword%>">&lt;</a> --%>
<%-- 			<%} %> --%>
			
<%-- 		<%} %> --%>
		
<!-- 		<!--  -->
<!-- 			이동 숫자에 반복문을 적용  -->
<!-- 			범위는 startBlock부터 finishBlock까지로 설정(상단에서 계산을 미리 해두었음) -->
<!-- 		--> -->
<%-- 		<%for(int i=startBlock; i <= finishBlock; i++){ %> --%>
<%-- 			<% --%>
// 				//현재 페이지에 해당하는 블록은 class="on"을 추가하여 출력하면 디자인 효과를 볼 수 있다.
// 				String prop;
// 				if(i == pageNo) {//현재 페이지 번호면
// 					prop = "class='on'";
// 				}
// 				else{//현재 페이지가 아니면
// 					prop = "";
// 				}
<%-- 			%> --%>
		
<%-- 			<%if(!isSearch){ %> --%>
<!-- 			<!-- 목록일 경우 페이지 번호만 전달 --> -->
<%-- 			<a href="list.jsp?page=<%=i%>" <%=prop%>><%=i%></a> --%>
<%-- 			<%}else{ %> --%>
<!-- 			<!-- 검색일 경우 페이지 번호와 검색 분류(type), 검색어(keyword)를 전달 --> -->
<%-- 			<a href="list.jsp?page=<%=i%>&type=<%=type%>&keyword=<%=keyword%>" <%=prop%>><%=i%></a> --%>
<%-- 			<%} %> --%>
<%-- 		<%} %> --%>
		
<!-- 		<!--  -->
<!-- 			다음 버튼을 누르면 finishBlock + 1 에 해당하는 페이지로 이동해야 한다 -->
<!-- 			(주의!) 다음이 없는 경우에는 출력하지 않는다(pageCount <= finishBlock) -->
<!-- 		 --> -->
<%-- 		<%if(pageCount > finishBlock){ %> --%>
<%-- 			<%if(!isSearch){ %>  --%>
<%-- 				<a href="list.jsp?page=<%=finishBlock + 1%>">&gt;</a> --%>
<%-- 			<%}else{ %> --%>
<%-- 				<a href="list.jsp?page=<%=finishBlock + 1%>&type=<%=type%>&keyword=<%=keyword%>">&gt;</a> --%>
<%-- 			<%} %> --%>
<%-- 		<%} %> --%>
<!-- 	</div> -->
</article>
<jsp:include page = "/template/footer.jsp"></jsp:include>