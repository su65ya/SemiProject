<%@page import="semi.beans.dto.ReservationDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.dao.ReservationDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    <%
    	int res_write = Integer.parseInt(request.getParameter("res_write"));
    	
    	ReservationDao rvdao = new ReservationDao();
    	List<ReservationDto> list = rvdao.getList(res_write);
    
    %>
    
    
    
<jsp:include page="/template/nav.jsp"></jsp:include>

<style>
	a {
		text-decoration: none;
		color: black;
	}
	
	.in-out {
		color: red;
	}
	
</style>


<article class="w-75">

	<div class="row">
		<h2>예약 내역</h2>
	</div>
	
	<table class="table table-sideopen table-hover">
		<thead>
			<tr>
				<th>예약일</th>
				<th width="40%">객실명</th>
				<th>예약자</th>
				<th>인원</th>
				<th>이용일</th>
				<th>결제금액</th>
			</tr>
		</thead>	
		<tbody>
			<% for (ReservationDto rvdto : list) { %>
				<tr>
					<td><%= rvdto.getRes_date() %></td>
					<td class="left">
						<a href="reservation_detail.jsp?res_no=<%= rvdto.getRes_no() %>">
							<%= rvdto.getRes_room_no() %>
						</a>
					</td>
					<td><%= rvdto.getRes_name() %></td>[]
					<td>성인2명</td>
					<td class="in-out"><%= rvdto.getRes_in() %> ~ <%= rvdto.getRes_out() %></td>
					<td><%= rvdto.getRes_price() %> 원</td>
				</tr>
			<%} %>
<!-- 
			<tr>
				<td>2020-07-13</td>
				<td class="left">
					[펜션이름]
					<a href="#">
						객실 이름
					</a>
				</td>
				<td>예약자명</td>
				<td>???</td>
				<td class="in-out">2020-07-15 ~ 2020-07-20</td>
				<td>11111원</td>
			</tr>
			 -->
			<!-- 
			<tr>
				<td>2020-07-13</td>
				<td class="left">
					[펜션이름]
					<a href="#">
						객실 이름
					</a>
				</td>
				<td>예약자명</td>
				<td>???</td>
				<td class="in-out">2020-07-15 ~ 2020-07-20</td>
				<td>11111원</td>
			</tr>
			 -->
		</tbody>
	
	</table>


</article>



<jsp:include page="/template/footer.jsp"></jsp:include>