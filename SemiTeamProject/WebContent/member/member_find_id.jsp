<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	

	.find, a {
		text-align: center;
		text-decoration: none;
		color: black;
	}
</style>


<jsp:include page = "/template/nav.jsp"></jsp:include>

<div aign = "center">

<form action="member/find_id.do"method="post">
	<article class= "w-20">


		<div class="row">
			<h2>아이디 찾기</h2>
		</div>



	<table border="1">
		<tbody>
			<tr>
				<th>이름</th>
				<td>
					<input type="text" name ="member_name"required>
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>
					<input type="text" name ="member_phone"required>
				</td>
			</tr>
			<tr>
				<th>생년월일</th>
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



<!--  에러처리  -->
<%if(request.getParameter("error")!=null){%>
<h6><font color= "red" >해당하는 정보를 찾을수 없습니다</font></h6>
<% }%>

</div>


<jsp:include page= "/template/footer.jsp"></jsp:include>

