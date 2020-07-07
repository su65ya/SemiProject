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
	<h2>회원정보</h2>

	<table border="1" width="400">
		<tbody>
			<tr>
				<th>아이디</th>
				<td><%=user.getMember_id()%></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<a href="change_password.jsp">비밀번호 변경</a>			
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td><%=mdto.getMember_name() %></td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td><%=mdto.getMember_birthdayFormat()%></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><%=mdto.getMember_mail() %></td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
					[<%=mdto.getMember_post() %>]
					<%=mdto.getMember_basic_addr() %>
					<%=mdto.getMember_detail_addr() %>
					상세주소
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><%=mdto.getMember_phone() %></td>
			</tr>
			<tr>
				<th>등급</th>
				<td><%=mdto.getMember_rate() %></td>
			</tr>
			<tr>
				<th>가입일</th>
				<td><%=mdto.getMember_join() %></td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2" align="center">
					<a href="change_info.jsp">정보 변경</a>
				</td>
			</tr>
		</tfoot>
	</table>
	
	<h5><a href="#">로그아웃</a></h5>
	<h5><a href="#">회원탈퇴</a></h5>

</div>


<jsp:include page="/template/footer.jsp"></jsp:include>