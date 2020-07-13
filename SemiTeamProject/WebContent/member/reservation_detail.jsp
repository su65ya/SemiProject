<%@page import="semi.beans.dao.ReservationDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int res_no = Integer.parseInt(request.getParameter("res_no"));

	ReservationDao rvdao = new ReservationDao();
	rvdao.get(res_no);

%>

<jsp:include page="/template/nav.jsp"></jsp:include>


<article class="w-60">

	<div class="row">
	 	<h2>예약 정보</h2>
	</div>
	<hr>
	
	<table class="table">
		<tbody>
			<tr>
				<th width="30%">객실이름</th>
				<td>???</td>
			</tr>
			<tr>
				<th>예약자명</th>
				<td>???</td>
			</tr>
			<tr>
				<th>체크인</th>
				<td>???</td>
			</tr>
			<tr>
				<th>체크아웃</th>
				<td>???</td>
			</tr>
			<tr>
				<th>연락처</th>
				<td>???</td>
			</tr>
			<tr>
				<th>옵션내역</th>
				<td>???</td>
			</tr>
			<tr>
				<th>결제금액</th>
				<td>???</td>
			</tr>
		</tbody>
	</table>


</article>



<jsp:include page="/template/footer.jsp"></jsp:include>