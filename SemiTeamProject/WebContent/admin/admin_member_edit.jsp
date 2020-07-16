<%@page import="semi.beans.dto.MemberDto"%>
<%@page import="semi.beans.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String member_id = request.getParameter("member_id");

	MemberDao mdao = new MemberDao();
	MemberDto mdto = mdao.get(member_id);
%>
<jsp:include page="/template/nav.jsp"></jsp:include>

<div align="center">
	<h2>회원 정보 수정</h2>
	
	<form action="admin_member_edit.do" method="post">
		<table border="1">
			<tbody>
				<tr>
					<th>아이디</th>
					<td>
						<%=mdto.getMember_id() %>
						<input type="hidden" name="member_id" value="<%=mdto.getMember_id()%>">
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<input type="text" name="member_pw" value="<%=mdto.getMember_pw()%>" required>
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>
						<input type="text" name="member_name" value="<%=mdto.getMember_name()%>">
					</td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td>
						<input type="text" name="member_birth" value="<%=mdto.getMember_birthdayFormat()%>">
					</td>
				</tr>
				<tr>
					<th>메일</th>
					<td>
						<input type="text" name="member_mail" value="<%=mdto.getMember_mail()%>">
					</td>
				</tr>
				<tr>
					<th rowspan="3">주소</th>
					<td>
						<input type="text" name="member_post" value="<%=mdto.getMember_post()%>">
						<input type="button" value="찾기">
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" name="member_basic_addr" value="<%=mdto.getMember_basic_addr()%>">
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" name="member_detail_addr" value="<%=mdto.getMember_detail_addr()%>">
					</td>
				</tr>
				<tr>
					<th>폰번호</th>
					<td>
						<input type="text" name="member_phone" value="<%=mdto.getMember_phone()%>">
					</td>
				</tr>
				<tr>
					<th>등급</th>
					<td>
						<select name="member_rate">
							<option>일반</option>
							<option>우수</option>
							<option>VIP</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>가입일</th>
					<td><%=mdto.getMember_join() %></td>
				</tr>
			</tbody>
			<tfoot>
				<tr align="center">
					<td colspan="2">
					<input type="submit" value="수정하기">
				</tr>
			</tfoot>
		</table>
	</form>

</div>

<jsp:include page="/template/footer.jsp"></jsp:include>