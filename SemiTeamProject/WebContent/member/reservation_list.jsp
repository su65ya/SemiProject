<%@page import="semi.beans.dto.RoomDto"%>
<%@page import="semi.beans.dao.RoomDao"%>
<%@page import="semi.util.DateChecker"%>
<%@page import="semi.beans.dto.ReservationDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.dao.ReservationDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    <%
    	int res_write = Integer.parseInt(request.getParameter("res_write"));
    	
    	ReservationDao rvdao = new ReservationDao();
    	List<ReservationDto> list = rvdao.getList(res_write);
    	RoomDao romdao = new RoomDao(); 
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
	.form-input,.form-btn2,.form-btn3{
	    	width: 15%;
	        padding: 0.5rem;
	        outline: none;/*선택시 자동 부여되는 테두리 제거*/
	        border: none;
	    	border-radius: 5px;
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
					<td><%= rvdto.getRes_date_day() %></td>
					<td class="left">
						<a href="reservation_detail.jsp?res_no=<%= rvdto.getRes_no() %>">
							<%RoomDto romdto = romdao.get(rvdto.getRes_room_no());%>
							<%=romdto.getRoom_name() %>
						</a>
					</td>
					<td><%= rvdto.getRes_name() %></td>
					<td>성인2명</td>
					<td class="in-out"><%= rvdto.getRes_date_day()%></td>
					<td style="text-align: right;"><%=DateChecker.cal(rvdto.getRes_price()) %> 원</td>
					
				</tr>
			<%} %>

		</tbody>
	
	</table>
<div class="row right">
	<a href = "<%=request.getContextPath()%>"><input type="button" value="홈으로" class="form-btn2 "></a>
	<a href="<%=request.getContextPath() %>/member/pension_list.jsp"><input type="button" value="예약하기" class="form-btn2 "></a>
</div>

</article>



<jsp:include page="/template/footer.jsp"></jsp:include>