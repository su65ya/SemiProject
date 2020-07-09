<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
    	span{
    		color:red;
    		font-size:16;
    	}
    	label{
    		font-size:13;
    		font-weight: bold;
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
        
        function changeNumber(no){
       		var checkTag = document.querySelectorAll("input[type=checkbox]");
      
        		if(checkTag[no].checked){
           			checkTag[no].value = "1";
        		}else{
           			checkTag[no].value="0";
        		}
        }
//         function AllchangeNum(){
//         	var allcheck = document.querySeletorAll(".select-all").checked;
        	
//         	if()
//         }
       
        
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
		<form action="room_regist.do" method="post">
		<input type = "hidden" name = "pension_no" value="<%=request.getParameter("pension_no")%>">
			<div class="row">
				<h2>객실 등록관리</h2>
			</div>
			
			<div class="row">
            	<label><span>*</span>객실명</label>
            	<input class="form-input" type="text" name="room_name" placeholder="20글자이내로 적어주세요." required autocomplete="none">
        	</div>
        	<div class="row-emptyy"></div>
        	<div class="row">
        		<label>객실타입</label>
        		<input class="form-input" type="text" name="room_type" placeholder="10글자이내로 적어주세요.">		
			</div>
			<div class="row-emptyy"></div>
			<div class="row">
        		<label><span>*</span>최소인원</label>
        		<input class="form-input" type="text" name="standard_people"required>
			</div>
			<div class="row-emptyy"></div>
			<div class="row">
        		<label><span>*</span>최대인원</label>
        		<input class="form-input" type="text" name="max_people"required>
			</div>
           	<div class="row-emptyy"></div>
            <div class="row">
        		<label><span>*</span>방넓이</label>
        		<input class="form-input" type="text" name="room_width"placeholder="평수"required>
			</div>
			<div class="row-emptyy"></div>
			<div class="row">
        		<label><span>*</span>화장실개수</label>
        		<input class="form-input" type="text" name="toilet_count"placeholder="ex)1" required>
			</div>
			<div class="row-emptyy"></div>
			<div class="row">
        		<label><span>*</span>비수기 평일 가격</label>
        		<input class="form-input" type="text" name="off_weekday" placeholder=""required>
			</div>
           <div class="row-emptyy"></div>
            <div class="row">
        		<label><span>*</span>비수기 주말 가격</label>
        		<input class="form-input" type="text" name="off_weekend"placeholder=""required>
			</div>
           <div class="row-emptyy"></div>
            <div class="row">
        		<label><span>*</span>성수기 평일 가격</label>
        		<input class="form-input" type="text" name="on_weekday"placeholder=""required>
			</div>
        <div class="row-emptyy"></div>
            <div class="row">
        		<label><span>*</span>성수기 주말 가격</label>
        		<input class="form-input" type="text" name="on_weekend"placeholder=""required>
			</div>
			<div class="row-emptyy"></div>
			<div class="row-empty"></div>
			<hr>
			<div class="row">
				<h4>옵션</h4>
			</div>
			<div class="row">
                <input class="select-item ck" type="checkbox" name="amenity" id="amenity" onchange="changeNumber(0);">
        		<label for="amenity">어메니티</label>
			</div>
			
			<div class="row">
                <input class="select-item ck" type="checkbox" name="microwave" id="micro" onchange="changeNumber(1);">
                <label for="micro">전자레인지</label>
			</div>
			
			<div class="row">
        		<input class="select-item ck" type="checkbox" name="bed" id="bed" onchange="changeNumber(2);">
        		<label for="bed">침대</label>
			</div>
           
            <div class="row">
                <input class="select-item ck" type="checkbox" name="tv" id="tv"onchange="changeNumber(3);">
        		<label for="tv">티비</label>
			</div>
			
			<div class="row">
                <input class="select-item ck" type="checkbox" name="room_sofa" id="sofa" onchange="changeNumber(4);">
        		<label for="sofa">소파</label>
			</div>
			
			<div class="row">
               <input class="select-item ck" type="checkbox" name="room_aircon" id="room_aircon" onchange="changeNumber(5);">
        		<label for="room_aircon">에어컨</label>
			</div>
			
			<div class="row">
               <input class="select-item ck" type="checkbox" name="fridge" id="fridge" onchange="changeNumber(6);">
        		<label for="fridge">냉장고</label>
			</div>
			
			<div class="row">
                <input class="select-item ck" type="checkbox" name="tub" id="tub" onchange="changeNumber(7);">
        		<label for="tub">욕조</label>
			</div>
            
            <div class="row">
                <input class="select-item ck" type="checkbox" name="hairdryer" id="hair" onchange="changeNumber(8);">
        		<label for="hair">드라이기</label>
			</div>
            
            <div class="row">
                <input class="select-item ck" type="checkbox" name="cookoo" id="cookoo" onchange="changeNumber(9);">
        		<label for="cookoo">밥솥</label>
			</div>
            
            <div class="row">
                <input class="select-item ck" type="checkbox" name="dog" id="dog" onchange="changeNumber(10);">
        		<label for="dog">반려견</label>
			</div>
			
			<div class="row right">
				<input type="checkbox" class="select-all" onchange="changeCheckbox(); changeAll(11);" id="ck">
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