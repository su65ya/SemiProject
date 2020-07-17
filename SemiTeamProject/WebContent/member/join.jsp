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
    	
		label {
			font-size: 15;
		}
		
		#id_check+label {
			color: black;
		}
		
		#id_check:checked+label {
			color: silver;
		}
	
		.find, a {
			text-align: center;
			text-decoration: none;
			color: black;
		}
		
		.form-input,.form-btn2,.form-btn3{
	    	width: 100%;
	        padding: 0.5rem;
	        outline: none;/*선택시 자동 부여되는 테두리 제거*/
	        border: none;
	    	border-radius: 5px;
	    }
	    .form-input:focus{
	    	border-color: #b2bec3;
	    }
	    .form-btn2{
	        background-color:#636e72;
	        width : 150px;
	        color: white;
	    	cursor: pointer;
	    }
	    .form-btn3{
	        background-color:#ff7675;
	        width : 150px;
	        color: white;
	        cursor: pointer;
	    }
	    .form-btn2:hover,.form-btn3:hover {
	        background-color:#b2bec3;
	    }
	    .font_color_a {
	        color : #636e72;
	        font-style: normal;
	    	font-size: 14px;
	    }
	    
	    .intext {
			width: 100%;
			padding-left: 0.5rem;
			padding: 0.5rem;
		}
		.table tr td .info {
			display: block;
			font-size: 13px;
			margin: 0.3rem;
		}
		
		.correct-message, .incorrect-message {
            display: none;
            !important;
        }
         
        .intext.correct ~ .correct-message {
            display: block;
            font-size: 13px;
            margin: 0.3rem;
        }
        
        .intext.incorrect ~ .incorrect-message {
            display: block;
            font-size: 13px;
            margin: 0.3rem;
        }
        
         
</style>
<jsp:include page="/template/nav.jsp"></jsp:include>
<script src="../js/join.js"></script>
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
                document.querySelector("input[name=member_post]").value = data.zonecode;
                document.querySelector("input[name=member_basic_addr]").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.querySelector("input[name=member_detail_addr]").focus();
            }
        }).open();
    }
    
    

</script>
	<div class="row">
		<article class="w-40">
		<form action="join.do" method="post" onsubmit="return memberJoin();">
			<div class="row">
				<h2>회원가입</h2>
			</div>
			
			<table class='table'>
				<tbody>
					<tr>
						<th width='20%'>
							<label><span>*</span>아이디</label>
						</th>
						<td class='left'>
							<div>
								<input class="intext " type="text" name="member_id" autocomplete="none" style='width: 250px;' onblur="idCheck();">
								<span class='incorrect-message'>아이디는 영문 소문자, 숫자 포함 8~20자 이내로 입력하세요</span>
								<span class='correct-message' style='color: #0984e3;'>사용가능한 아이디입니다</span>
							</div>	
						</td>
					</tr>
					<tr>
						<th>
							<label><span>*</span>비밀번호</label>
						</th>
						<td>
							<div class='row left'>
								<input class="intext " type="password" name="member_pw" autocomplete="none" style='width: 250px;' onblur="pwCheck()">
								<span class='incorrect-message'>비밀번호는 영문 대,소문자, 숫자, 특수 문자 포함 8~20자 이내로 입력하세요</span>
							</div>
						</td>
					</tr>
					<tr>
						<th>
							<label><span>*</span>이름(실명)</label>
						</th>
						<td>
							<div class="row left">
								<input class="intext" type = "text" name = "member_name" autocomplete="none" style='width: 250px;' onblur='nameCheck();'>
								<span class='incorrect-message'>이름을 입력해주세요</span>
							</div>
						</td>
					</tr>
					<tr>
						<th>
							<label><span>*</span>생년월일</label>
						</th>
						<td>
							<div class="row left">
								<input class="intext" type = "date" name="member_birth" autocomplete="none" onblur="birthCheck();" style="width: auto">
								<span class='incorrect-message'>생년월일을 입력해주세요</span>
							</div>
						</td>
					</tr>
					<tr>
						<th>
							<label><span>*</span>이메일</label>
						</th>
						<td>
							<div class="row left">
								<input class="intext" type = "text" name="member_mail" style='width: 250px;' onblur="mailCheck();">
								<span class='incorrect-message'>이메일 입력해주세요</span>
							</div>
						</td>
					</tr>
					<tr>
						<th rowspan="3">
							<label>주소</label>
						</th>
						<td>
							<div class="row left">
								<input class="intext form-inline" type="text" name="member_post" placeholder="우편번호" size="6" maxlength="6" autocomplete="none" style='width: auto'>
								<input class='form-btn2' onclick = "findAddress();" type = "button" value="우편번호 찾기" style='width: 110px; padding-top: 0.5rem;'>
							</div>
						</td>
					</tr>
					
					<tr>
						<td>
							<!-- 기본주소 -->
							<div class="row left">
								<input class="intext" type="text" name="member_basic_addr" placeholder="기본주소 입력" size="50" autocomplete="none">
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<!-- 상세주소 -->
							<div class="row left">
								<input class="intext" type="text" name="member_detail_addr" placeholder="상세주소 입력" size="50" autocomplete="none">
							</div>
						</td>
					</tr>
					<tr>
					    <th>
				            <label><span>*</span>핸드폰번호</label>
					    </th>
					    <td>
					        <div class="row left">
				                <input class="intext" type="text" name="member_phone" placeholder="'-' 제외하고 입력" onblur="phoneCheck();" style='width: 250px;' maxlength="11">
                                <span class='incorrect-message'>핸드폰 번호를 입력해주요</span>
                            </div>
					        
					    </td>
					</tr>
				</tbody>
			</table>
			
			<div class = "row-empty"></div>
			<div class="row center">
				<input class= "form-btn3" style='font-size: 20px; width: 200px;' type="submit" value="가입하기">
			</div>
			
        </form>
		
        </article>
</div>
<jsp:include page="/template/footer.jsp"></jsp:include>