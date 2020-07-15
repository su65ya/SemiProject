<%@page import="semi.beans.dao.MemberDao"%>
<%@page import="semi.beans.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
    MemberDto mdto = (MemberDto) session.getAttribute("userinfo");
 
 	int member_no = mdto.getMember_no();
	MemberDao mdao = new MemberDao();
	MemberDto user = mdao.getNo(member_no);
 %>
 
<jsp:include page="/template/nav.jsp"></jsp:include>

 <style>
        .form-input,.form-btn2{
            padding: 0.3rem;
            outline: none;/*선택시 자동 부여되는 테두리 제거*/
            border: 1px solid black;
        }
        .form-btn2{
        	background-color:lightgray;
            color: black;
            cursor: pointer;
        }
        
        a {
        	text-decoration: none;
        }  
 </style>
    
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
						<a href="change_password.jsp">
						<input class="form-btn form-inline" type="button"  value="비밀번호 변경">
						</a>
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td class="left"><%=user.getMember_name() %></td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td class="left"><%=user.getMember_day() %></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td class="left"><%=user.getMember_mail() %></td>
				</tr>
				<tr>
					<th>주소</th>
					<td class="left">
						<%= user.getRead_post() %>
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
					<td class="left"><%=user.getJoin_day() %></td>
				</tr>
			</tbody>		
		</table>

	</div>
	<div class="row right">
		<a href="member_delete.do">
			<input class= "form-btn form-inline" type="button" value="회원 탈퇴">
		</a>
		<a href="change_info.jsp">
			<input class= "form-btn form-inline" type="button" value="회원정보 수정">
		</a>
	</div>
	
	<div class="row-empty"></div> 
	
</article>

<jsp:include page="/template/footer.jsp"></jsp:include>