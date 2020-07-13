<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
					<th>요금타입</th>
					<th>이용요금</th>
					<th>결제금액</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="left">펜션객실이름</td>
					<td style="color: #ea1f62">2020-07-15</td>
					<td>성인 5명</td>
					<td>비수기/주중</td>
					<td>500,000원</td>
					<td>700,000원</td>
				</tr>
				<tr>
					<td class="left">펜션객실이름</td>
					<td style="color:#ea1f62 ">2020-07-15</td>
					<td>성인 5명</td>
					<td>비수기/주중</td>
					<td>500,000원</td>
					<td>700,000원</td>
				</tr>
				<tr>
					<td class="left">펜션객실이름</td>
					<td style="color: #ea1f62">2020-07-15</td>
					<td>성인 5명</td>
					<td>비수기/주중</td>
					<td>500,000원</td>
					<td>700,000원</td>
				</tr>
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



