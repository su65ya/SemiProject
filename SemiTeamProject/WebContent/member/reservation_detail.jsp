<%@page import="semi.beans.dao.ReservationFlowDao"%>
<%@page import="semi.util.DateChecker"%>
<%@page import="semi.beans.dto.RoomDto"%>
<%@page import="semi.beans.dao.RoomDao"%>
<%@page import="semi.beans.dto.ReservationDto"%>
<%@page import="semi.beans.dao.ReservationDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int res_no = Integer.parseInt(request.getParameter("res_no"));

	ReservationDao rvdao = new ReservationDao();
	ReservationDto rdto = rvdao.get(res_no);
	
	RoomDao rdao = new RoomDao();
	RoomDto roomDto = rdao.get(rdto.getRes_room_no());
	
	ReservationFlowDao flowDao = new ReservationFlowDao();
	
%>

<jsp:include page="/template/nav.jsp"></jsp:include>

<style>
.form-btn2,.form-btn3{
	    	width: 20%;
	        padding: 0.5rem;
	        outline: none;/*선택시 자동 부여되는 테두리 제거*/
	        border: none;
	    	border-radius: 5px;
	    }

</style>
<article class="w-60">

	<div class="row">
	 	<h2>예약 정보</h2>
	</div>
	<hr>
	
	<table class="table">
		<tbody>
			<tr>
				<th width="30%">객실이름</th>
				<td><%=roomDto.getRoom_name() %></td>
			</tr>
			<tr>
				<th>예약자명</th>
				<td><%=rdto.getRes_name() %></td>
			</tr>
			<tr>
				<th>체크인</th>
				<td><%=rdto.getRes_in_day() %></td>
			</tr>
			<tr>
				<th>체크아웃</th>
				<td>익일 11시</td>
			</tr>
			<tr>
				<th>결제금액</th>
				<td><%=DateChecker.cal(rdto.getRes_price()) %>원</td>
			</tr>
		</tbody>
	</table>
	<div style="margin-top: 80px;"></div>
<div >
		<a href="<%=request.getContextPath() %>/review/write.jsp?review_pension_no=<%=roomDto.getRoom_pension_no() %>&res_no=<%=rdto.getRes_no()%>">
			<input class="form-btn3" type="button" value="리뷰쓰기" style="float: right">
		</a>
</div>
</article>



<jsp:include page="/template/footer.jsp"></jsp:include>