<%@page import="semi.beans.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String member_id = request.getParameter("member_id");	

	MemberDao mdao = new MemberDao();
	List<MemberDto> list = mdao.search(member_id);
%>
<jsp:include page="/template/nav.jsp"></jsp:include>

<div align="center">
	<h2>회원목록</h2>
	
	<table border="1" width="650">
		<thead>
			<tr>
				<th>아이디 </th>
				<th>이름</th>
				<th>권한 </th>
				<th>관리메뉴</th>
			</tr>
			
		</thead>
		<tbody align="center">
			<%for(MemberDto mdto : list) {%>
			<tr>
				<th><%=mdto.getMember_id() %></th>
				<th><%=mdto.getMember_name()%></th>
				<th><%=mdto.getMember_rate() %></th>
				<th>
					<a href="admin_member_detail.jsp?member_id=<%=mdto.getMember_id() %>">상세보기</a>
				</th>
			</tr>
			<%} %>
			
		</tbody>
	</table>

	
	<!-- 검색창 -->
	<form action="admin_member_list.jsp" method="get">
		<select>
			<option>아이디</option>
			<option>이름</option>	
		</select>
		<%if (member_id == null) {%>
		<input type="text" name="member_id" required>
		<%} else {%>
		<input type="text" name="member_id" required value="<%=member_id%>">
		<%} %>
		<input type="submit" value="검색">
	</form>
	
</div>




<jsp:include page="/template/footer.jsp"></jsp:include>