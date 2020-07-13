<%@page import="semi.beans.dto.MemberDto"%>
<%@page import="semi.beans.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%
	String member_id = request.getParameter("member_id");
	
	MemberDao mdao = new MemberDao();
	MemberDto user = mdao.get(member_id);
%>

<jsp:include page="/template/nav.jsp"></jsp:include>

<article class="w-50">
	<div class="row">
		<h2>회원정보</h2>
	</div>
	<div class="row">
		<table class="table table-sideopen table-hover">
			<tbody>
				<tr>
					<th>아이디</th>
					<td class="left"><%=user.getMember_id()%></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td class="left">
						<a href="#">
						<input class="form-btn2" type="button"  value="비밀번호 변경">
						</a>
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td class="left"><%=user.getMember_name() %></td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td class="left"><%=user.getMember_birthdayFormat()%></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td class="left"><%=user.getMember_mail() %></td>
				</tr>
				<tr>
					<th>주소</th>
					<td class="left">
						[<%=user.getMember_post() %>]
						<%=user.getMember_basic_addr() %>
						<%=user.getMember_detail_addr() %>
					</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td class="left"><%=user.getMember_phone() %></td>
				</tr>
				<tr>
					<th>등급</th>
					<td class="left"><%=user.getMember_rate() %></td>
				</tr>
				<tr>
					<th>가입일</th>
					<td class="left"><%=user.getMember_join() %></td>
				</tr>
			</tbody>		
		</table>

	</div>
	<div class="row" style="float: left;">
		<a href="admin_member_list.jsp">
			<input class= "form-btn" style="width: 150px;" type="button" value="◀회원 리스트">
		</a>
	</div>
	<div class="row" style="float: right;">
		<a href="<%=request.getContextPath() %>/admin/memberDrop.do?=member_id=<%=user.getMember_id()%>">
			<input class= "form-btn" style="width: 150px;" type="button" value="회원 탈퇴">
		</a>
	</div>
	<div class="row" style="float: right;">
		<a href="#">
			<input class= "form-btn" style="width: 150px;" type="button" value="회원정보 수정">
		</a>
	</div>
	
	<div class="row-empty"></div> 
	
</article>


<jsp:include page="/template/footer.jsp"></jsp:include>