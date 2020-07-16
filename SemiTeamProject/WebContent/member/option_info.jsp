<%@page import="semi.beans.dao.ReservationFlowDao"%>
<%@page import="semi.beans.dto.ReservationStep2Dto"%>
<%@page import="semi.beans.dto.MemberDto"%>
<%@page import="semi.beans.dto.RoomDto"%>
<%@page import="semi.beans.dao.RoomDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="/template/nav.jsp"></jsp:include>
<style>
	.form-btn{
		width: 20%;
		
	}
	span{
		color:#ea1f62;
		font-size: 15px;
	}
</style>
<script>
	function bbq_check(tag) {
		var parentTag = tag.parentNode;
		var hidden = parentTag.children[1];
		
		console.log(parentTag);
		console.log(hidden);
		
		if(tag.checked){
			hidden.value = "1";
		}else{
			hidden.value = "0";
		}
	}
	
	function check_adult(tag) {
		var parentTd = tag.parentNode;
		var parentTr = parentTd.parentNode;
		
		var extraTag = parentTr.children[3];//추가인원(td)
		var extra = extraTag.textContent;
		var adult = tag.value;//tag(input)
		
		var childTd = parentTr.children[6];//td
		var child = childTd.children[0].value;//tag(input)
		var childTag = childTd.children[0];
		
		var isAdd = extra<(adult+child);
		if(!isAdd){
			alert("추가 가능 인원에 맞춰서 추가해주세요");
			tag.value = "0";//어른 태그의 값
			childTd.value = "0";
		}
		console.log("추가인원"+extra);
		console.log("어른 인원"+adult);
		console.log("아동 인원"+child);
		console.log(isAdd);
		
	}
	function check_children(tag){
		var parentTd = tag.parentNode;//이 태그의 부모 td
		var parentTr = parentTd.parentNode;//td의 부모 tr
		
		var extraTag = parentTr.children[3];//추가인원(td)
		var extra = extraTag.textContent;
		var adultTd = parentTr.children[5];//td
		var adult = adultTd.children[0].value;//tag(input)
		var adultTag = adultTd.children[0];
		
		var child = tag.value;//tag(input)
		var isAdd = extra<(adult+child);
		if(isAdd){
			alert("추가 가능 인원에 맞춰서 추가해주세요");
		}
	
		console.log("추가인원"+extra);
		console.log("어른 인원"+adult);
		console.log("아동 인원"+child);
		console.log(isAdd);
		
	}
</script>
<%
	int reservation_no = Integer.parseInt(request.getParameter("reservation_no"));
	ReservationFlowDao flowdao = new ReservationFlowDao();
	
	List<ReservationStep2Dto> list = flowdao.getList(reservation_no);
	RoomDao roomdao = new RoomDao();

%>
<div class="row center">
		<h2>선택 객실 옵션 선택</h2>
	</div>
	<div class="row-empty"></div>
	<hr>
	<div class="row-empty"></div>
	<div class="row left">
		<h3>선택 객실 목록 <span>(*필수사항이 아니며 선택사항이 없다면 하단의 옵션 선택완료 버튼을 눌러주세요)</span></h3>

	<form action="reservation_step3.do?reservation_no=<%=reservation_no %>" method="post">
	
	<div class="row">
		<table class="table table-sideopen">
			<thead>
				<tr>
					<th width="50%">객실명</th>
					<th>이용일</th>
					<th>기본인원</th>
					<th>추가가능 인원</th>
					<th>숯불</th>
					<th>성인</th>
					<th>아동</th>
				</tr>
			</thead>
			<tbody>
			<%for(ReservationStep2Dto step2dto : list){ 
				RoomDto rdto = roomdao.get(step2dto.getRoom_no());
			%>
				<tr>
					<td><%=rdto.getRoom_name() %>
					<input type="hidden" name="step2_no" value ="<%=step2dto.getStep2_no() %>">
					</td>
					<td><%=step2dto.getReservation_date_day() %>
					</td>
					<%
						int standard = rdto.getStandard_people();
						int max = rdto.getMax_people();
						int extra = max-standard;
					%>
					
					<td><%=standard %></td>
					<td class="extra"><%=extra %></td>
					<td><input type = "checkbox" id = "bbq" onchange="bbq_check(this);">
					<input type = "hidden" name = "bbq" value = "0"></td>
					<td>
						<select name = "adult"  onchange="check_adult(this);">
							<option value = "0">선택</option>
							<option value = "1">1명</option>
							<option value = "2">2명</option>
							<option value = "3">3명</option>
						</select>
					</td>
					<td>
						<select name = "children"  onchange="check_children(this);">
							<option value = "0">선택</option>
							<option value = "1">1명</option>
							<option value = "2">2명</option>
							<option value = "3">3명</option>
						</select>
					</td>
				</tr>
			<%} %>
			</tbody>
	</table>
	<div class="row-empty"></div>
	<div class="row-empty"></div>
	<div class="row center">
		<input class = "form-btn" type = "submit" value = "옵션 선택완료">
	</div>
	</div>
	</form>
	</div>
<jsp:include page="/template/footer.jsp"></jsp:include>