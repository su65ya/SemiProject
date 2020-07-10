<%@page import="semi.beans.dto.PensionDto"%>
<%@page import="semi.beans.dao.PensionDao"%>
<%@page import="semi.beans.dto.RoomDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.dao.RoomDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>


</style>
<jsp:include page="/template/nav.jsp"></jsp:include>
<%
	PensionDao pdao = new PensionDao();
	RoomDao rdao = new RoomDao();
	List<RoomDto> list = rdao.getList();
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
					<input type="hidden" name="pension_no" value="<%=(request.getParameter("pension_no"))%>">
					<%=(request.getParameter("pension_name"))%>
					</th>
				</tr>
			</thead>
			<tbody>
			<%for(RoomDto rdto : list){ %>
				<tr>
  					<td rowspan="7">객실 사진</td>
   					<td class="left" >객실명 : <%=rdto.getRoom_name() %></td>
  				</tr>
  				<tr>
  					<td class="left">객실 유형 : <%=rdto.getRoom_type() %></td>
  				</tr>
  				<tr>
    				<td class="left">인원 : 기준<%=rdto.getStandard_people() %>명 / 최대<%=rdto.getMax_people() %>명</td>
  				</tr>
  				<tr>
    				<td class="left">방평수 : <%=rdto.getRoom_width() %>형</td>
  				</tr>
  				<tr>
  					<td class="left">화장실개수 : <%=rdto.getToilet_count() %>개  </td>
  				</tr>
  				<tr>
  					<td class="left">
  						비수기 평일/주말가격 : <%=rdto.getOff_weekday() %>원 / <%=rdto.getOff_weekend() %>원<br>
  						성수기 평일/주말가격 : <%=rdto.getOn_weekday() %>원 / <%=rdto.getOn_weekend() %>원
  					</td>
  				</tr>
  				<tr>
    				<td class="row right">
					<a href = "password_check.jsp?go=room_delete.do?room_no=<%=rdto.getRoom_no()%>">
					<input class = "form-btn form-inline" type="button" value = "객실삭제">
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
	
</article>
<jsp:include page="/template/footer.jsp"></jsp:include>