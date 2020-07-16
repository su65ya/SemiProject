<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/nav.jsp"></jsp:include>

<style>
	.intext {
		width: 100%;
		padding-left: 0.5rem;
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
    
    /*입력창*/
    .intext.correct {
        border: 1px solid #0984e3;;
    } 
    .intext.incorrect {
        border: 1px solid #ff7675;
    }
    /*메시지*/
    .correct-message {
        color: #0984e3;
        font-size: 12px;
    }
    .incorrect-message {
        color: #ff7675;
        font-size: 12px;
    }
    .correct-message, .incorrect-message {
        display: none;
    }
    .intext.correct~.correct-message {
        display: block;
    }
    .intext.incorrect~.incorrect-message {
        display: block;
    }
</style>
<script>
    //1. 입력한 비밀번호가 현재 비밀번호와 같은지 검사
    function checkPw1() {
        
    }
    //2. 새 비밀번호가 형식에 맞는지 검사
    function checkPw2() {
        var regex = /[a-z0-9]{8,20}/g;
        var pw2 = document.querySelector("input[name=pw2]").value;
        
        var isValid = regex.test(pw2);
        
        var pw2Tag = document.querySelector("input[name=pw2]");
        pw2Tag.classList.remove("correct");
        pw2Tag.classList.remove("incorrect");
        
            if (isValid) {
                pw2Tag.classList.add("correct");
            }
            else {
                pw2Tag.classList.add("incorrect");
             }
    }
    //3. 새비밀번호 확인이 새 비밀번호와 같은지 검사
    function checkPw3() {
        var pw3Tag = document.querySelector("input[name=pw3]");
            pw3Tag.classList.remove("correct");
            pw3Tag.classList.remove("incorrect");
        
        if(document.querySelector("input[name=pw2]").value!=''&&
          document.querySelector("input[name=pw3]").value!='') {
            
            if(document.querySelector("input[name=pw2]").value==
               document.querySelector("input[name=pw3]").value) {            
                pw3Tag.classList.add("correct");
            }
            else {
                pw3Tag.classList.add("incorrect");
            }
        }
    }
        
    function checkForm() {
        var pw2IsValid = checkPw2();
        if (!pw2IsValid) { //새비밀번호가 틀렸다면
            processPw2(pw2IsValid);
        }
    }
    
</script>


<article class="w-30">
	<div class="row">
		<h2 >비밀번호 변경</h2>
	</div>
	
	<form action="change_password.do" method="post" onsubmit="return checkForm();">
	<div class="row">
		<table class="table table-sideopen">
			<tbody>
				<tr>
					<th style="width:150px;">현재 비밀번호</th>	
					<td class="left">
					    <div>
						<input class="intext" name="pw1" id="pw" type="password" onblur="" placeholder="현재 비밀번호">
						<span class="correct-message">현재 비밀번호와 일치합니다</span>
						<span class="incorrect-message">비밀번호가 맞는지 확인하세요</span>
						</div>
					</td>
					
				</tr>
				<tr>
					<th>새 비밀번호</th>
					
					<td class="left">
					    <div>
						<input class="intext" name="pw2" id="pwCheck" type="password" onblur="checkPw2();" placeholder="새 비밀번호">
						<span class="correct-message">형식에 맞는 비밀번호입니다</span>
						<span class="incorrect-message">영문 소문자와 숫자 8~20자로 구성하세요</span>
				        </div>
					</td>
				</tr>
				<tr>
					<th>새 비밀번호 확인</th>
					<td class="left">
					    <div>
						<input class="intext" name="pw3" type="password" onblur="checkPw3();" placeholder="새 비밀번호 확인">
						<span class="correct-message">새 비밀번호와 일치합니다</span>
						<span class="incorrect-message">새 비밀번호와 일치하지 않습니다</span>
						</div>
					</td>
				</tr>
			</tbody>
		</table>

	</div>
	
	<div class="row-empty"></div> 
		
	<div style="float: right;">
		<input class="form-btn3" style="width: 120px;" type="submit" value="변경">
	</div>
	</form>
	<div style="float: right;">
		<a href="info.jsp">
		<input class="form-btn2" style="width: 120px;" type="button" value="취소">
		</a>
	</div>
	
</article>



    
<jsp:include page="/template/footer.jsp"></jsp:include>