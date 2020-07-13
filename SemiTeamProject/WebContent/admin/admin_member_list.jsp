<%@page import="java.util.ArrayList"%>
<%@page import="semi.beans.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String type = request.getParameter("type");
	String keyword = request.getParameter("keyword");

	MemberDao mdao = new MemberDao();
	
	//타입과 키워드가 없다면
	List<MemberDto> list;
	if( type == null || keyword == null ) {
		list = new ArrayList<>();
	}
	else {
		list = mdao.search(type, keyword);		
	}
%>
<jsp:include page="/template/nav.jsp"></jsp:include>

<div align="center">
	<h2>회원목록</h2>
	
	<table border="1" width="650">
		<thead>
			<tr>
				<th>no</th>
				<th>아이디 </th>
				<th>이름</th>
				<th>권한 </th>
				<th>상세정보</th>
			</tr>
			
		</thead>
		<tbody align="center">
			<%for(MemberDto mdto : list) {%>
			<tr>
				<th><%=mdto.getMember_no()%></th>
				<th><%=mdto.getMember_id() %></th>
				<th><%=mdto.getMember_name()%></th>
				<th><%=mdto.getMember_rate() %></th>
				<th>
					<a href="admin_member_detail.jsp?member_id=<%=mdto.getMember_id() %>">
						<input type="button" value="상세정보보기">
					</a>
				</th>
			</tr>
			<%} %>
			
		</tbody>
	</table>

	
	<!-- 검색창 -->
	<form action="admin_member_list.jsp" method="get">
		<select name="type">
			<option value="member_id">아이디</option>
			<option value="member_name">이름</option>
			<option value="member_rate">권한</option>
		</select>


		<input type="text" name="keyword" required placeholder="검색어 입력" >
		<input type="submit" value="검색">
	</form>
	
	<hr>
	
	<h4>총 <%= list.size() %>개의 데이터 발견</h4>
	
	
</div>




<jsp:include page="/template/footer.jsp"></jsp:include>