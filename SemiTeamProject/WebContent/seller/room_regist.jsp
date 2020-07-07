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
    	#ck + label {
            color:black;
        }
        #ck:checked + label {
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

   <article class="w-40">
		<form action="room_regist.do" method="post">
			<div class="row">
				<h2>객실 관리</h2>
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
			
			<div class="row">
                <input class="select-item" type="checkbox" name="amenity" id="ck">
        		<label>어메니티</label>
			</div>
			
			<div class="row">
                <input class="select-item" type="checkbox" name="microwave" id="ck">
                <label>전자레인지</label>
			</div>
			
			<div class="row">
        		<input class="select-item" type="checkbox" name="bed" id="ck">
        		<label>침대</label>
			</div>
           
            <div class="row">
                <input class="select-item" type="checkbox" name="tv" id="ck">
        		<label>티비</label>
			</div>
			
			<div class="row">
                <input class="select-item" type="checkbox" name="room_sofa" id="ck">
        		<label>소파</label>
			</div>
			
			<div class="row">
               <input class="select-item" type="checkbox" name="room_aircon" id="ck">
        		<label>에어컨</label>
			</div>
			
			<div class="row">
               <input class="select-item" type="checkbox" name="fridge" id="ck">
        		<label>냉장고</label>
			</div>
			
			<div class="row">
                <input class="select-item" type="checkbox" name="tub" id="ck">
        		<label>욕조</label>
			</div>
            
            <div class="row">
                <input class="select-item" type="checkbox" name="hairdryer" id="ck">
        		<label for="ck">드라이기</label>
			</div>
            
            <div class="row">
                <input class="select-item" type="checkbox" name="cookoo" id="ck">
        		<label>밥솥</label>
			</div>
            
            <div class="row">
                <input class="select-item" type="checkbox" name="dog" id="ck">
        		<label>반려견</label>
			</div>
			<div class="row right">
				<input type="checkbox" class="select-all" onchange="changeCheckbox();">
				<label>전체선택/해제</label>
			</div>
			<hr>
			<div class="row-empty"></div>
			<div class="row">
				<label>객실 사진 등록</label><br>
				<div class="row-empty"></div>
				<input type="file" name="room_image" multiple accept=".jpg,.png,.gif">
			</div>
            <div class="row-empty"></div>
            <div class="row-empty"></div>
            <div class="row">
        		<input class="form-btn" type="submit" value="객실등록하기">
			</div>
            
		</form>
	</article>
   
<jsp:include page="/template/footer.jsp"></jsp:include>