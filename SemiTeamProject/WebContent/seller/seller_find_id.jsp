<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<jsp:include page = "/template/nav.jsp"></jsp:include>

<article class= "w-25">
	<form action="seller_find_id.do"method="post">

		<div class="row">
			<h2>아이디 찾기</h2>
		</div>
		
		<table class='table'>
			<tbody>
				<tr>
					<th>이름</th>
					<td>
						<input class='form-input' type="text" name="seller_name" required>
					</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>
						<input class='form-input' type="text" name="seller_phone" placeholder="'-'제외하고 입력" required>
					</td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td>
						<input class='form-input' type="date" name="seller_birth" required>
					</td>
				</tr>
				<tr>
					<th>사업자등록번호</th>
					<td>
						<input class='form-input' type="text" name="company_no" placeholder="'-'제외하고 입력" required>
					</td>
				</tr>
			</tbody>
		</table>

		<% if (request.getParameter("error") != null) {	%>
			<h6><font color="#ff0000">아이디를 찾을 수 없습니다</font></h6>
		<%} %>


		<div class='row'>
			<input class='form-btn' type="submit" value="찾기">
		</div>

	</form>
	

</article>

<jsp:include page= "/template/footer.jsp"></jsp:include>

