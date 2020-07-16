<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/nav.jsp"></jsp:include>

<style>
	.intext {
		width: 100%;
		padding-left: 0.5rem;
	}
</style>
 
<article class="w-30">
	<div class="row">
		<h2>비밀번호 변경</h2>
	</div>
	
	<form action="change_password.do" method="post">
	
	<div class="row">
		<table class="table table-sideopen">
			<tbody>
				<tr>
					<th>현재 비밀번호</th>
					<td class="left">
						<input class="intext" type="password" name='nowPassword' placeholder="현재 비밀번호" required>
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
						<input class="intext" type="password" name='member_pw' placeholder="새 비밀번호 확인" required>
					</td>
				</tr>
			</tbody>
		</table>
		
	<div class="row-empty"></div>
	<div class="row center">
           	<% if (request.getParameter("error") != null) {	%>
			<!-- 오류 메시지는 페이지에 error라는 파라미터가 있을 경우에만 -->
			<font color="#ff0000" size="2px">입력하신 비밀번호 정보가 맞지 않습니다</font>
			<%} %>
     </div>


	</div>
	
	<div class="row-empty"></div> 
		
	<div style="float: right;">
		<input class="form-btn" style="width: 120px;" type="submit" value="변경">
	</div>
	</form>
	<div style="float: right;">
		<a href="info.jsp">
		<input class="form-btn" style="width: 120px;" type="button" value="취소">
		</a>
	</div>
	
</article>
    
<jsp:include page="/template/footer.jsp"></jsp:include>