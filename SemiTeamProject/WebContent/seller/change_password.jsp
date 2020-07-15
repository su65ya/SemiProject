<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/nav.jsp"></jsp:include>

<style>
	.intext{
		width: 100%;
		padding-left:
	}

</style>
<article class="w-30">
	<h2>비밀번호 변경</h2>
	
	<form action="seller_change_password.do" method ="post">
	<table class="table table-sideopen">
		<tbody>
			<tr>
				<th>현재 비밀번호</th>
				<td class="left">
					<input class="intext" type="password" placeholder="현재 비밀번호"required>
				</td>
			</tr>
			<tr>
				<th>새 비밀번호</th>
					<td class="left">
						<input class="intext" type="password" placeholder="새 비밀번호" required>
					</td>
				</tr>
				<tr>
					<th>새 비밀번호 확인</th>
					<td class="left">
						<input class="intext" type="password" placeholder="새 비밀번호 확인" required>
					</td>
				</tr>
		</tbody>
	
	</table>
	<div style="float: right;">
		<a href="info.jsp">
		<input class="form-btn" style="width:120px;" type="submit" value="qusrud">
		</a>
	</div>
	</form>
	<div style = "float: right;">
		<a href="info.jsp>
		<input class="form=btn" style="width" 120px;" type="" value="취소">
		</a>
	</div>
	
</article>

<jsp : include page= "/template/footer.jsp"></jsp:include>