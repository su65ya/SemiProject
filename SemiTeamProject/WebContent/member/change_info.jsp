<%@page import="semi.beans.dao.MemberDao"%>
<%@page import="semi.beans.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
    MemberDto mdto = (MemberDto) session.getAttribute("userinfo");
 	
 	String member_id = mdto.getMember_id();
 	MemberDao mdao = new MemberDao();
 	MemberDto user = mdao.get(member_id);
 %>
 
<jsp:include page="/template/nav.jsp"></jsp:include>

<div align="center">
	<h2>회원 정보 수정</h2>
	
	<form action="change_info.do" method="post">
		
		<table border="1" width="400">
		<tbody>
			<tr>
				<th>생년월일</th>
				<td>
					<input type="text" name="member_birth" value="<%=user.getMember_birthdayFormat() %>" required>
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
					<input type="text" name="member_mail" value="<%=user.getMember_mail()%>" required>
				</td>
			</tr>
			<tr>
				<th rowspan="3">주소</th>
				<td>
					<input type="text" name="member_post" size="6" maxlength="6" value="<%=user.getMember_post()%>" placeholder="우편번호">
					<input type="button" value="찾기">
				</td>
			<tr>
				<td>
					<input type="text" name="member_basic_addr" value="<%=user.getMember_basic_addr()%>" placeholder="기본주소">
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" name="member_detail_addr" value="<%=user.getMember_detail_addr()%>" placeholder="상세주소">
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>
					<input type="text" name="member_phone" value="<%=user.getMember_phone() %>" required>
				</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="수정하기">
				</td>
			</tr>
		</tfoot>
	
	</table>
	
	</form>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>