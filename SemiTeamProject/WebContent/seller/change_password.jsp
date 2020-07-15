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
				<th>새 비밀번호</th>
					<td class="left">
						<input class="form-input" type="password" placeholder="새 비밀번호" required>
					</td>
				</tr>
				<tr>
					<th>새 비밀번호 확인</th>
					<td class="left">
						<input class="form-input" type="password" name='seller_pw' placeholder="비밀번호 재입력" required>
					</td>
				</tr>
		</tbody>
	
	</table>
	
	<div class='row-empty'></div>
	
	<div class="row right">
		<input class="form-btn form-inline" type="submit" value="변경">
		<a href="seller_info.jsp">
			<input class="form-btn form-inline" type="button" value="취소">
		</a>
	</div>
	</form>
</article>

<jsp:include page= "/template/footer.jsp"></jsp:include>