<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<link rel="stylesheet" type="./scc/table_ex.css">
<jsp:include page = "/template/nav.jsp"></jsp:include>

<div aign = "center">

<form action="member/find_id.do"method="post">
	<article class= "w-20">


		<div class="row">
			<h2>아이디 찾기</h2>
		</div>



	<table class = "type02">
		<tbody>
			<tr>
				<th scope="row">이름</th>
				<td>
					<input type="text" name ="member_name"required>
				</td>
			</tr>
			<tr>
				<th scope="row">전화번호</th>
				<td>
					<input type="text" name ="member_phone"required>
				</td>
			</tr>
			<tr>
				<th scope="row">생년월일</th>
				<td>
					<input type="text" name = "member_birth"required>
				</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td align ="center" colspan="2">
					<input type="submit"value="찾기">
				</td>
			</tr>
		</tfoot>
				
				
	</table>
	
	</article>

</form>



</div>


<jsp:include page= "/template/footer.jsp"></jsp:include>

