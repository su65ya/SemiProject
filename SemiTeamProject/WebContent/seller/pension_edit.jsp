<%@page import="semi.beans.dto.PensionImageDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.dao.PensionImageDao"%>
<%@page import="semi.beans.dto.PensionInfoDto"%>
<%@page import="semi.beans.dto.PensionOptionDto"%>
<%@page import="semi.beans.dao.PensionOptionDao"%>
<%@page import="semi.beans.dao.PensionDao"%>
<%@page import="semi.beans.dto.PensionDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    int pension_no = Integer.parseInt(request.getParameter("pension_no"));
	PensionDao pdao = new PensionDao();
	PensionInfoDto pdto = pdao.get(pension_no);
    
	PensionOptionDao podao = new PensionOptionDao();
	
	PensionImageDao pidao = new PensionImageDao();
	List<PensionImageDto> imageList = pidao.getList(pension_no);
	
	
	
	int fire_price = podao.getPrice(pension_no, "숯불");
	int adult_price = podao.getPrice(pension_no, "성인");
	int child_price = podao.getPrice(pension_no, "아동");
	int dog_price = podao.getPrice(pension_no, "반려견");
	
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
    //등록 사진 미리보기
    function preview(){
        var fileTag = document.querySelector("input[name=pension_image]");
        
        var divTag = document.querySelector(".preview-wrap");
        
        if(fileTag.files.length > 0){
            //선택된 파일들을 다 읽어와서 이미지 생성 후 추가
            //미리보기 전부 삭제
            divTag.innerHTML = "";
            
            for(var i=0; i < fileTag.files.length; i++){
                var reader = new FileReader();
                reader.onload = function(data){
                    //img 생성 후 data.target.result 설정하여 추가
                    var imgTag = document.createElement("img");
                    imgTag.setAttribute("src", data.target.result);
                    imgTag.setAttribute("width", "120");
                    imgTag.setAttribute("height", "120");
                    divTag.appendChild(imgTag);
                };
                reader.readAsDataURL(fileTag.files[i]);
            }
            
        }
        else{
            //미리보기 전부 삭제
            divTag.innerHTML = "";
        }
    }
    
</script>
	<article class="w-40">
		<form action="pension_edit.do" method="post" enctype="multipart/form-data">
		<!-- 수정이 가능하도록 PK를 숨김 첨부한다 -->
		<input type="hidden" name="pension_no" value="<%=pension_no%>">
			<div class="row-empty"></div>
			<div class="row">
				<h2>펜션 정보 수정</h2>
			</div>
			<div class="row-empty"></div>
			<div class="row">
				<label><span>*</span>펜션 이름</label>
				<input class="form-input" type="text" name="pension_name" value="<%=pdto.getPension_name() %>" required>
			</div>
			
			<div class="row">
				<label><span>*</span>주소 입력</label><br>
				<input class="form-input form-inline" type="text" name="pension_post" value="<%=pdto.getPension_post() %>" required>
				<input onclick="findAddress();" type="button" value="우편번호 찾기">
			</div>
			<div class="row-emptyy"></div>
			<div class="row">
				<input class="form-input" type="text" name="pension_basic_addr" value='<%= pdto.getPension_basic_addr() %>' required>
			</div>
			<div class="row-emptyy"></div>
			<div class="row">
				<input class="form-input" type="text" name="pension_detail_addr" value="<%=pdto.getPension_detail_addr() %>" required>
			</div>
			<div class="row">
				<label><span>*</span>펜션 전화번호</label>
				<input class="form-input" type="text" name="pension_phone" value=<%=pdto.getPension_phone() %> required>
			</div>
			<div class="row">
				<label><span>*</span>펜션 소개글</label>
				<textarea rows="15" cols="77" name="pension_intro" required><%=pdto.getPension_intro() %></textarea>
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
			<div class="row-empty"></div>
			<div class="row">
			<!-- 숯불  -->
				<label class="select option_name1">숯불</label>&nbsp;&nbsp;
				<input class="form-input option_price1 form-inline" type="number" value="<%=fire_price %>" onchange="setOption1();">
				<input type="hidden" name="option" value="">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<!-- 성인  -->
				<label class="select option_name2">성인</label>&nbsp;&nbsp;&nbsp;
				<input class="form-input option_price2 form-inline" type="number" value =<%=adult_price %> onchange="setOption2();">
				<input type="hidden" name="option" value="">
			</div>
			<div class="row-emptyy"></div>
			<div class="row">
			<!-- 아동  -->
				<label class="select option_name3">아동</label>&nbsp;&nbsp;
				<input class="form-input option_price3 form-inline" type="number" value="<%=child_price %>" onchange="setOption3();">
				<input type="hidden" name="option" value="">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<!-- 반려견 -->
				<label class="select option_name4">반려견</label>&nbsp;
				<input class="form-input option_price4 form-inline" type="number" value="<%=dog_price %>" onchange="setOption4();">
				<input type="hidden" name="option" value="">
			</div>
			<div class="row-emptyy"></div><hr>
			<div class="row-emptyy"></div>
		
			<div class="row-empty"></div>
			<div class="row-empty"></div>
			<div class="row">
			<%for(PensionImageDto pmdto : imageList){ %>
 				<img src="download.do?pen_image_no=<%=pmdto.getPen_image_no()%>" width="90" height="90">
 			<%} %>
			</div>
			<div class="row-empty"> 
			<div class="row">
				<label>펜션 사진 수정</label><br>
				<div class="row-empty"></div>
				<input type="file" name="pension_image" multiple accept=".jpg,.png,.gif" onchange="preview();">
			</div>
			<div class="row-empty"></div>
			<div class="row-empty"></div>
			<div class="row-empty"></div>
			<div class="row">
			<div class="row">
			<div class="row right">
			
				<input class= "form-btn form-inline center" type="submit" value="수정하기">
				<a href="pension_list.jsp">
					<input class="form-btn form-inline center" type="button" value="목록보기">
				</a>
			</div>
			</div>
			<div class="row"></div>
		</form>
	</article>

<jsp:include page="/template/footer.jsp"></jsp:include>
