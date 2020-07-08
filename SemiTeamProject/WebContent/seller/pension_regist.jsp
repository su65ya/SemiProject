<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String option_name=request.getParameter("option_name");
   		String option_price = request.getParameter("option_price");
   		String option = option_name+"-"+option_price;
    %>
        <style>
    	span{
    		color:red;
    		font-size:16;
    	}
    	label{
    		font-size:13;
    		font-weight: bold;
    	}
    	
    	.select{
    		height: 36px;
            width: 70px;
    	}
    	.price {
    		width: 60px;
    	}
    	span{
    		color:red;
    		font-size:16;
    	}
    	.ck + label {
            color:black;
        }
        .ck:checked + label {
            color:silver;
        }
    </style>
    <script>
        function changeCheckbox(){
            
            var selectAll = document.querySelector(".select-all").checked;
            
            var selectItem = document.querySelectorAll(".select-item");
            
            for(var i in selectItem){
                selectItem[i].checked = selectAll;    
            }
        }
    </script>
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
    
    function setOption1(){
    	var option_nameTag = document.querySelector(".option_name1");
    	var option_priceTag = document.querySelector(".option_price1");
    	
    	var hidden = document.querySelector(".option_price1 + input[type=hidden]");
    	
    	if(option_priceTag.value){
    		hidden.value=option_nameTag.textContent+"-"+option_priceTag.value+"-0";
    	}else{
    		hidden.value="";
    	}
    }
    function setOption2(){
    	var option_nameTag = document.querySelector(".option_name2");
    	var option_priceTag = document.querySelector(".option_price2");
    	
    	var hidden = document.querySelector(".option_price2 + input[type=hidden]");
    	
    	if(option_priceTag.value){
    		hidden.value=option_nameTag.textContent+"-"+option_priceTag.value+"-0";
    	}else{
    		hidden.value="";
    	}
    }
    function setOption3(){
    	var option_nameTag = document.querySelector(".option_name3");
    	var option_priceTag = document.querySelector(".option_price3");
    	
    	var hidden = document.querySelector(".option_price3 + input[type=hidden]");
    	
    	if(option_priceTag.value){
    		hidden.value=option_nameTag.textContent+"-"+option_priceTag.value+"-0";
    	}else{
    		hidden.value="";
    	}
    }
    function setOption4(){
    	var option_nameTag = document.querySelector(".option_name4");
    	var option_priceTag = document.querySelector(".option_price4");
    	
    	var hidden = document.querySelector(".option_price4 + input[type=hidden]");
    	
    	if(option_priceTag.value){
    		hidden.value=option_nameTag.textContent+"-"+option_priceTag.value+"-0";
    	}else{
    		hidden.value="";
    	}
    }
    
    function plusswim(){
    	var swim = document.querySelector("#swim");
    	if(swim.checked){
    		swim.value = "수영장-0-1";
    	}else{
    		swim.value = "";
    	}
    }
    function plusfoot(){
    	var swim = document.querySelector("#foot");
    	if(swim.checked){
    		swim.value = "족구장-0-1";
    	}else{
    		swim.value = "";
    	}
    }
    function plussing(){
    	var swim = document.querySelector("#sing");
    	if(swim.checked){
    		swim.value = "노래방-0-1";
    	}else{
    		swim.value = "";
    	}
    }
    function plustak(){
    	var swim = document.querySelector("#tak");
    	if(swim.checked){
    		swim.value = "탁구장-0-1";
    	}else{
    		swim.value = "";
    	}
    }
    function plusPublic(){
    	var swim = document.querySelector("#public_bbq");
    	if(swim.checked){
    		swim.value = "공용 바베큐장-0-1";
    	}else{
    		swim.value = "";
    	}
    }
    function plusPrivate(){
    	var swim = document.querySelector("#private_bbq");
    	if(swim.checked){
    		swim.value = "개별 바베큐-0-1";
    	}else{
    		swim.value = "";
    	}
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
				<input onclick="findAddress();" type="button" value="우편번호 찾기"><br>
			</div>
			<div class="row-emptyy"></div>
			<div class="row">
				<input class="form-input" type="text" name="pension_basic_addr" placeholder="기본주소" required><br>
			</div>
			<div class="row-emptyy"></div>
			<div class="row">
				<input class="form-input" type="text" name="pension_detail_addr" placeholder="상세주소" required><br>
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
			<div class="row-empty"></div>
			<div class="row"><hr></div>
			<div class="row-empty"></div>
			<div class="row-empty"></div>
			<div class="row center">
				<label>옵션</label>
			</div>
			<div class="row-empty"></div>
			<div class="row">
				<!-- 사용자에게 보여줄 화면 : 여기서 값이 입력되면 위의 태그로 자동 전송 -->
				<label class="select option_name1">숯불</label>&nbsp;&nbsp;
				<input class="form-input option_price1 form-inline" type="number" placeholder="가격 ex)10000" onblur="setOption1();">
				
				<!-- 실제 전송될 데이터 -->
				<input type="hidden" name="option" value="">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<label class="select option_name2">성인</label>&nbsp;&nbsp;&nbsp;
				<input class="form-input option_price2 form-inline" type="number" placeholder="가격 ex)10000" onblur="setOption2();">
				
				<input type="hidden" name="option" value="">
			</div>
			<div class="row-emptyy"></div>
			<div class="row">
				<!-- 사용자에게 보여줄 화면 : 여기서 값이 입력되면 위의 태그로 자동 전송 -->
				<label class="select option_name3">아동</label>&nbsp;&nbsp;
				<input class="form-input option_price3 form-inline" type="number" placeholder="가격 ex)10000" onblur="setOption3();">
				
				<!-- 실제 전송될 데이터 -->
				<input type="hidden" name="option" value="">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<label class="select option_name4">반려견</label>&nbsp;
				<input class="form-input option_price4 form-inline" type="number" placeholder="가격 ex)10000 (선택)" onblur="setOption4();">
				
				<input type="hidden" name="option" value="">
			</div>
			<div class="row-emptyy"></div><hr>
			<div class="row-emptyy"></div>
			<div class="row center">
				<label>펜션 시설</label>
			</div>
			<div class="row-empty"></div>
			<div class="row-empty"></div>
			<div class="row-empty"></div>
			<div class="row">
                <input class="select-item form-inline ck swim" type="checkbox" name="option" id="swim" onchange="plusswim();" value="">
        		<label for="swim">수영장</label>
        		<input class="select-item form-inline ck" type="checkbox" name="option" id="foot" onchange="plusfoot();">
        		<label for="foot">족구장</label>
        		<input class="select-item form-inline ck" type="checkbox" name="option" id="sing" onchange="plussing();">
        		<label for="sing">노래방</label>
        		<input class="select-item form-inline ck" type="checkbox" name="option" id="tak"  onchange="plustak();">
        		<label for="tak">탁구장</label>
        		<input class="select-item form-inline ck" type="checkbox" name="option" id="public_bbq" value="" onchange="plusPublic();">
        		<label for="public_bbq">공용 바베큐장</label>
        		<input class="select-item form-inline ck" type="checkbox" name="option" id="private_bbq" value="" onchange="plusPrivate();">
        		<label for="private_bbq">개별 바베큐</label>
			</div>
			<div class="row-empty"></div>
			<div class="row-empty"></div>
			<div class="row-empty"></div><hr>
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