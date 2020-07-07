<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <style>
    	span{
    		color:red;
    		font-size:16;
    	}
    	label{
    		font-size:13;
    	}
    </style>
<jsp:include page="/template/nav.jsp"></jsp:include>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
//우편번호 찾기 및 주소 입력 자바스크립트
    function findAddress() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    //document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                   // document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.querySelector("input[name=pension_post]").value = data.zonecode;
                document.querySelector("input[name=pension_basic_addr]").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.querySelector("input[name=pension_detail_addr]").focus();
            }
        }).open();
    }
</script>
	<article class="w-40">
		<form action="pension_regist.do" method="post">
			<div class="row-empty"></div>
			<div class="row">
				<h2>펜션 등록</h2>
			</div>
			<div class="row-empty"></div>
			<div class="row">
				<label><span>*</span>펜션 이름</label>
				<input class="form-input" type="text" name="pension_name" placeholder="16자 이내" required>
			</div>
			
			<div class="row">
				<label><span>*</span>주소 입력</label><br>
				<input class="form-input form-inline" type="text" name="pension_post" placeholder="우편번호" required>
				<input onclick="findAddress();" type="button" value="우편번호 찾기">
			</div>
			<div class="row">
				<input class="form-input" type="text" name="pension_basic_addr" placeholder="기본주소" required>
			</div>
			<div class="row">
				<input class="form-input" type="text" name="pension_detail_addr" placeholder="상세주소" required>
			</div>
			<div class="row">
				<label><span>*</span>펜션 전화번호</label>
				<input class="form-input" type="text" name="pension_phone" placeholder="펜션 전화번호" required>
			</div>
			<div class="row">
				<label><span>*</span>펜션 소개글</label>
				<textarea rows="15" cols="77" name="pension_intro" required></textarea>
			</div>
			<div class="row-empty"></div>
			<div class="row">
				<label>펜션 사진 등록</label><br>
				<div class="row-empty"></div>
				<input type="file" name="pension_image" multiple accept=".jpg,.png,.gif">
			</div>
			<div class="row-empty"></div>
			<div class="row">
				<input class= "form-btn" type="submit" value="등록하기">
			</div>
			<div class="row"></div>
		
		</form>
	</article>


<jsp:include page="/template/footer.jsp"></jsp:include>