<%@page import="semi.beans.dto.PensionDto"%>
<%@page import="semi.beans.dao.PensionDao"%>
<%@page import="semi.beans.dto.RoomDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.dao.RoomDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
.table.left{
	border-left:none;
}
</style>
<jsp:include page="/template/nav.jsp"></jsp:include>
<%
	PensionDao pdao = new PensionDao();
	RoomDao rdao = new RoomDao();
	List<RoomDto> list2 = rdao.getList();
%>

<!-- 객실 목록 리스트 -->
<article class="w-60">
	<div class="row">
		<h2>객실 목록</h2>	
	</div>
	<!-- 객실 목록 -->
	<div class="row list">
		<table class="table table-sideopen">
			<thead>
				<tr>
					<th colspan="4">
					<input type="hidden" name="pension_name" value="<%=(request.getParameter("pension_name"))%>">
					<%=(request.getParameter("pension_name"))%>
					</th>
				</tr>
			</thead>
			<tbody>
			<%for(RoomDto rdto : list2){ %>
				<tr>
  					<td rowspan="4">객실 사진</td>
   					<td class="left"> <%=rdto.getRoom_name() %></td>
  				</tr>
  				<tr>
    				<td class="left"> 기준<%=rdto.getStandard_people() %>명/최대<%=rdto.getMax_people() %>명</td>
  				</tr>
  				<tr>
    				<td class="left"> <%=rdto.getRoom_width() %>형</td>
  				</tr>
  				<tr>
    				<td class="row right">
					<a href="예약.jsp">
					<input class = "form-btn form-inline" type="button" value = "예약하기">
					</a>
					</td>
  				</tr>
				<%} %>
			</tbody>
		</table>
		<!-- 객실 등록버튼 -->
		
	</div>
	<!-- 네비게이터 -->
	<div class="row"></div>
		
	</div>
</article>
<jsp:include page="/template/footer.jsp"></jsp:include>