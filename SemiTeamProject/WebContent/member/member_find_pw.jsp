<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<jsp:include page = "/template/nav.jsp"></jsp:include>

<article class= "w-25">
	<form action="find_pw.do"method="post">

		<div class="row">
			<h2>비밀번호 찾기</h2>
		</div>

		<table class='table'>
			<tbody>
				<tr>
					<th>아이디</th>
					<td>
						<input class='form-input' type="text" name="member_id" required>
					</td>
				</tr>
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
			<h6><font color="#ff0000">비밀번호를 찾을 수 없습니다</font></h6>
		<%} %>


		<div class='row'>
			<input class='form-btn' type="submit" value="찾기">
		</div>
	
	</form>

</article>


<jsp:include page= "/template/footer.jsp"></jsp:include>

