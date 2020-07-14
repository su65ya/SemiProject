<%@page import="semi.beans.dto.RoomDto"%>
<%@page import="semi.beans.dao.RoomDao"%>
<%@page import="semi.beans.dao.PensionOptionDao"%>
<%@page import="semi.beans.dto.PensionDto"%>
<%@page import="semi.beans.dao.PensionDao"%>
<%@page import="semi.beans.dao.ReservationOptionInfoDao"%>
<%@page import="semi.beans.dto.ReservationOptionInfoDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.dto.ReservationInfoDto"%>
<%@page import="semi.beans.dao.ReservationDao"%>
<%@page import="semi.beans.dao.ReservationInfoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ReservationInfoDto redto = new ReservationInfoDto();
	ReservationInfoDao redao = new ReservationInfoDao();
	ReservationOptionInfoDto ridto = new ReservationOptionInfoDto();
	ReservationOptionInfoDao ridao = new ReservationOptionInfoDao();
	RoomDao roomdao = new RoomDao();
	
	PensionOptionDao podao = new PensionOptionDao();
	PensionDao pdao = new PensionDao();
	ridto = ridao.get();
	List<ReservationInfoDto> list = redao.getList();
	int pension_no = ridto.getPension_no();
	int total_adlut_price;
	if(ridto.getAdult()!=null){
		int adult = Integer.parseInt(ridto.getAdult());
		int adult_price = podao.getPrice(pension_no, "성인");
		total_adlut_price = adult_price * adult;
	}else{
		total_adlut_price = 0;
	}
	int fire_price;
	if(ridto.getFire().equals(1)){
		fire_price = podao.getPrice(pension_no, "숯불");
	}else{
		fire_price = 0;
	}
	int total_children_price;
	if(ridto.getChildren()!=null){
		int children = Integer.parseInt(ridto.getChildren());
		int children_price = podao.getPrice(pension_no, "아동");
		total_children_price = children_price*children;
	}else{
		total_children_price = 0;
	}
	
	int extraPrice = total_children_price+fire_price+total_adlut_price;
	
%>
<jsp:include page="/template/nav.jsp"></jsp:include>
    <style>
        .table > tbody > tr > td{
            padding: 1.5rem;
        }
		.float-box::after{
            content:"";
            display: inline;
            clear:both;
        }
    </style>
	<div class="row center">
		<h2>예약 결제</h2>
	</div>
	<div class="row-empty"></div>
	<hr>
	<div class="row-empty"></div>
	<div class="row left">
		<h3>선택 객실 목록</h3>
	</div>
	
	
	<form action="reservation.do" method="post">
	<div class="row">
		<table class="table table-sideopen">
			<thead>
				<tr>
					<th width="50%">객실명</th>
					<th>이용일</th>
					<th>인원</th>
					<th>이용요금</th>
					<th>추가요금</th>
					<th>결제금액</th>
				</tr>
			</thead>
			<tbody>
				<%for(ReservationInfoDto rdto : list){ %>
				<tr>	
				<%RoomDto roomdto = roomdao.get(rdto.getRes_room_no()); %>
					<td class="left"><%=rdto.getRes_room_name() %></td>
					<td style="color: #ea1f62"><%=rdto.getRes_date() %></td>
					<td>성인 <%=roomdto.getStandard_people()%>명</td>
					<td><%=rdto.getRes_room_price() %>원</td>
					<%int room_price = Integer.parseInt(rdto.getRes_room_price()); %>
					<td><%=extraPrice %>원</td>
					<td><%=extraPrice+room_price%>원</td>
				</tr>
				<%} %>
			</tbody>
		</table>
		<div class="row right">
		    <h3>총 결제 금액 : <span style="color :#ea1f62 "> 3,300,000</span>원</h3>
		</div>
		<div class="row-empty"></div>
		<div class="row-empty"></div>
		<div  class="float-box" style="width: 45%; float: left;">
		<div class="row-empty"></div>
		<div class="row-empty"></div>
			<div class="row" style="border-bottom: 2px solid black">
				<h3>약관동의</h3>
			</div>
			<div class="row-empty"></div>
			<div class="row">
				<input type="checkbox" id="agree1" required>
				<label for="agree1">이용시 유의사항에 동의</label>
			</div>
			<div class="row">
				<input type="checkbox" id="agree2" required>
				<label for="agree2">취소 수수료에 동의</label>
			</div>
			<div class="row">
				<input type="checkbox" id="agree3" required>
				<label for="agree3">개인정보 수집 및 이용에 동의</label>
			</div>
			<div class="row">
				<input type="checkbox" id="agree4" required>
				<label for="agree4">개인정보 제3자 제공에 동의</label>
			</div>
			<div class="row">
				<input type="checkbox" id="agree5" required>
				<label for="agree5">이용자가 미성년자가 아니며 성인임에 동의</label>
			</div>
			<div class="row" style="border-bottom: 2px solid black">
					<h3>결제 금액</h3>
			</div>
			<div class="row-empty"></div>
			<div class="row right">
				<h3>3,300,000원</h3>
			</div>
			<div class="row-empty"></div>
			<div class="row-empty"></div>
			<div class="row">
				<input class="form-btn" type="submit" value = "예약하기">
			</div>
		</div>	
		
		<div class="row-empty"></div>
		<div class="row-empty"></div>
		<div class="float-box info" style="width: 45%; float: right;">
			<div class="row" style="border-bottom: 2px solid black">
				<h3>예약정보입력</h3>
			</div>
			<div class="row-empty"></div>
						<div class="row">
				<span>예약자명</span>
				<input  class="form-input" type="text" name="res_write" placeholder="예약자이름" required>
				<div class="row-emptyy"></div>
				<span style="color: firebrick;">예약자 실명을 입력해주세요 예약확인시 혼동이 될 수 있습니다.</span>
				<div class="row-emptyy"></div>
			</div>
			<div class="row">
				<span>생년월일</span>
				<input  class="form-input"  type="text" name="member_birth" placeholder="예약자 생년월일" required>
				<div class="row-emptyy"></div>
				<span style="color: firebrick;">예)1995-05-31</span>
				<div class="row-emptyy"></div>
			</div>
			<div class="row">
				<span>연락처</span>
				<input class="form-input" type="text" name="member_phone" placeholder="연락처" required>
				<div class="row-emptyy"></div>
				<span style="color: firebrick;">예약관련 정보가 문자메세지로 전송됩니다</span>
				<div class="row-emptyy"></div>
			</div>
			<div class="row">
				<span>결제수단</span>
				<select required>
				<option>신용카드</option>
				<option>카카오페이</option>
				<option>네이버페이</option>
				<option>계좌이체</option>
				</select>
				<div class="row-empty"></div>
				<div class="row-empty"></div>
			</div>
		</div>
		<div class="row-empty"></div>
		<div class="row-empty"></div>
	</div>
	<div class="row"></div>
	<div class="row" style="clear:both"></div>
	</form>
	
	<jsp:include page="/template/footer.jsp"></jsp:include>



