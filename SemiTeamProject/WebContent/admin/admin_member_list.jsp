<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="/template/nav.jsp"></jsp:include>

<div align="center">
	<h2>회원목록</h2>
	
	
	<table border="1" width="650">
		<thead>
			<tr>
				<th>이름</th>
				<th>아이디 </th>
				<th>권한 </th>
				<th>관리메뉴</th>
			</tr>
			
		</thead>
		<tbody align="center">
			<tr>
				<th>?</th>
				<th>? </th>
				<th>?</th>
				<th>?</th>
			</tr>
		</tbody>
	</table>
	
	<!-- 검색창 -->
	<form action="#" method="get">
		<select>
			<option>아이디</option>
			<option>이름</option>
			
		</select>
		<input type="text" name="member_id" required>
		<input type="submit" value="검색">
	</form>
	
</div>




<jsp:include page="/template/footer.jsp"></jsp:include>