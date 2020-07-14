<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int pension_no = Integer.parseInt(request.getParameter("pension_no"));
%>
<style>
    	span{
    		color:red;
    		font-size:16;
    	}
    	label{
    		font-size:13;
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
            var selectItem1 = document.querySelectorAll(".select-item");
            var selectItem2 = document.querySelectorAll(".select-item+input");

            for(var n in selectItem1){
            	selectItem1[n].checked = selectAll;
            	
            }
            for(var i in selectItem2){
            		if(selectAll){
            			selectItem2[i].value="1";
            		}else{
            			selectItem2[i].value="0";
            		}
            	}
            }
            
          

        function ckck() {
            var check_count = document.getElementsByClassName("select-item");
            var hidden= document.querySelectorAll(".select-item+input");
            
            for (var i=0; i<check_count.length; i++) {
                if (check_count[i].checked) {
                	hidden[i].value="1";
                }else{
                	hidden[i].value="0";
                }
          	}
        }
        

        function preview(){
            var fileTag = document.querySelector("input[name=room_image]");
            
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
<jsp:include page="/template/nav.jsp"></jsp:include>

   <article class="w-40">
		<form action="room_regist.do" method="post" enctype="multipart/form-data">
		<input type = "hidden" name = "pension_no" value = "<%=pension_no%>">
			<div class="row">
				<h2>객실 등록관리</h2>
			</div>
			
			<div class="row">
            	<label><span>*</span>객실명</label>
            	<input class="form-input" type="text" name="room_name" placeholder="20글자이내로 적어주세요." required autocomplete="none">
        	</div>
        	
        	<div class="row">
        		<label>객실타입</label>
        		<input class="form-input" type="text" name="room_type" placeholder="10글자이내로 적어주세요.">		
			</div>
			<div class="row">
        		<label><span>*</span>최소인원</label>
        		<input class="form-input" type="text" name="standard_people"required>
			</div>
			
			<div class="row">
        		<label><span>*</span>최대인원</label>
        		<input class="form-input" type="text" name="max_people"required>
			</div>
           
            <div class="row">
        		<label><span>*</span>방넓이</label>
        		<input class="form-input" type="text" name="room_width"placeholder="평수"required>
			</div>
			
			<div class="row">
        		<label><span>*</span>화장실개수</label>
        		<input class="form-input" type="text" name="toilet_count"placeholder="ex)1" required>
			</div>
			
			<div class="row">
        		<label><span>*</span>비수기 평일 가격</label>
        		<input class="form-input" type="text" name="off_weekday" placeholder=""required>
			</div>
           
            <div class="row">
        		<label><span>*</span>비수기 주말 가격</label>
        		<input class="form-input" type="text" name="off_weekend"placeholder=""required>
			</div>
           
            <div class="row">
        		<label><span>*</span>성수기 평일 가격</label>
        		<input class="form-input" type="text" name="on_weekday"placeholder=""required>
			</div>
        
            <div class="row">
        		<label><span>*</span>성수기 주말 가격</label>
        		<input class="form-input" type="text" name="on_weekend"placeholder=""required>
			</div>
			<div class="row-empty"></div>
			<hr>
			<div class="row">
				<h4>옵션</h4>
			</div>
			<div>
			<input class="select-item ck" type="checkbox" id="amenity_id" onchange="ckck();">
			<input type="hidden" name="amenity" value = "0">
        		<label for="amenity_id">어메니티</label>
			</div>
			
			<div class="row">
                <input class="select-item ck" type="checkbox" id="microwave_id" onchange="ckck();" >
                <input type="hidden" name="microwave" value = "0">
                <label for="microwave_id">전자레인지</label>
			</div>
			
			<div class="row">
        		<input class="select-item ck" type="checkbox" id="bed_id" onchange="ckck();">
        		<input type="hidden" name="bed" value = "0">
        		<label for="bed_id">침대</label>
			</div>
           
            <div class="row">
                <input class="select-item ck" type="checkbox"  id="tv_id"onchange="ckck();">
                <input type="hidden" name="tv" value = "0">
        		<label for="tv_id">티비</label>
			</div>
			
			<div class="row">
                <input class="select-item ck" type="checkbox"  id="room_sofa_id" onchange="ckck();" >
                <input type="hidden" name="room_sofa" value = "0">
        		<label for="room_sofa_id">소파</label>
			</div>
			
			<div class="row">
               <input class="select-item ck" type="checkbox" id="room_aircon_id" onchange="ckck();">
               <input type="hidden" name="room_aircon" value = "0">
        		<label for="room_aircon_id">에어컨</label>
			</div>
			
			<div class="row">
               <input class="select-item ck" type="checkbox" id="fridge_id" onchange="ckck();" >
               <input type="hidden" name="fridge" value = "0">
        		<label for="fridge_id">냉장고</label>
			</div>
			
			<div class="row">
                <input class="select-item ck" type="checkbox" id="tub_id" onchange="ckck();" >
                <input type="hidden" name="tub" value = "0">
        		<label for="tub_id">욕조</label>
			</div>
            
            <div class="row">
                <input class="select-item ck" type="checkbox" id="hairdryer_id" onchange="ckck();">
                <input type="hidden" name="hairdryer" value = "0">
        		<label for="hairdryer_id">드라이기</label>
			</div>
            
            <div class="row">
                <input class="select-item ck" type="checkbox"  id="cookoo_id" onchange="ckck();" >
                <input type="hidden" name="cookoo" value = "0">
        		<label for="cookoo_id">밥솥</label>
			</div>
            
            <div class="row">
                <input class="select-item ck" type="checkbox" id="dog_id" onchange="ckck();">
                <input type="hidden" name="dog" value = "0">
        		<label for="dog_id">반려견</label>
			</div>
			
			<div class="row right">
 				<input type="checkbox" class="select-all ck" onchange="changeCheckbox();" id="ck">
 				
				<label for="ck">전체선택/해제</label>
			</div>
	
			 
			<hr>
			<div class="row">
				<h4>객실 사진 등록</h4>
				<div class="row-empty"></div>
				<input type="file" name="room_image" multiple accept=".jpg,.png,.gif" onchange="preview();">
				<div class="preview-wrap"></div>
			</div>
            <div class="row-empty"></div>
            <div class="row-empty"></div>
            <div class="row">
        		<input class="form-btn" type="submit" value="객실등록하기">
			</div>
            
		</form>
	</article>
   
<jsp:include page="/template/footer.jsp"></jsp:include>