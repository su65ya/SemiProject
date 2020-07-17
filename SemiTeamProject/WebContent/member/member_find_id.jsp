<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page = "/template/nav.jsp"></jsp:include>

<style>

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

</style>


<article class= "w-25">
	<form action="find_id.do"method="post">

		<div class="row">
			<h2>아이디 찾기</h2>
		</div>
		
		<table class='table'>
			<tbody>
				<tr>
					<th>이름</th>
					<td>
						<input class='form-input' type="text" name="member_name" required>
					</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>
						<input class='form-input' type="text" name="member_phone" placeholder="'-'제외하고 입력" required>
					</td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td>
						<input class='form-input' type="date" name="member_birth" required>
					</td>
				</tr>
			</tbody>
		</table>

		<% if (request.getParameter("error") != null) {	%>
			<h6><font color="#ff0000">아이디를 찾을 수 없습니다</font></h6>
		<%} %>


		<div class='row center'>
			<input class='form-btn2' type="submit" value="찾기">
		</div>

	</form>
	
</article>

<jsp:include page= "/template/footer.jsp"></jsp:include>

