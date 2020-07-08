<%@page import="semi.beans.dao.PensionDao"%>
<%@page import="semi.beans.dto.PensionDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page = "/template/nav.jsp"></jsp:include>

<%
	PensionDao pdao = new PensionDao();
	List<PensionDto> list = pdao.getList();

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
					<th colspan="2">관리</th>
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
					<td><a href="room_regist.jsp?pension_no=<%=pdto.getPension_no()%>">객실목록</a></td>
					<td><a href="#">객실등록</a></td>
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
	<div class="row"></div>
</article>
<jsp:include page = "/template/footer.jsp"></jsp:include>