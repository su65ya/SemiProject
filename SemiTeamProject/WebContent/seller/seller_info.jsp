<%@page import="semi.beans.dto.SellerDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
    SellerDto mdto = (SellerDto) session.getAttribute("userinfo");
 %>
 
<jsp:include page="/template/nav.jsp"></jsp:include>

<div align="center">
	<h2>회원정보</h2>

	<table border="1" width="400">
		<tbody>
			<tr>
				<th>아이디</th>
				<th><%=mdto.getSeller_id() %></th>
			</tr>
			<tr>
				<th>비밀번호</th>
				<th><%=mdto.getSeller_pw() %>h>
			</tr>
			<tr>
				<th>이름</th>
				<th><%=mdto.getSeller_name() %></th>
			</tr>
			<tr>
				<th>생년월일</th>
				<th><%=mdto.getSeller_birth()%></th>
			</tr>
			<tr>
				<th>이메일</th>
				<th><%=mdto.getSeller_email() %></th>
			</tr>
			<tr>
				<th>주소</th>
				<th>
					[<%=mdto.getSeller_post() %>]
					<%=mdto.getSeller_basic_addr() %>
					<%=mdto.getSeller_detail_addr() %>
					상세주소
				</th>
			</tr>
			<tr>
				<th>전화번호</th>
				<th><%=mdto.getSeller_phone() %></th>
			</tr>
			<tr>
				<th>사업자번호</th>
				<th><%=mdto.getCompany_no() %></th>
			</tr>
			<tr>
				<th>가입일</th>
				<th><%=mdto.getSeller_join() %></th>
			</tr>
		</tbody>
	
	</table>
	
	<h5><a href="#">비밀번호 변경</a></h5>
	<h5><a href="#">개인정보 변경</a></h5>
	<h5><a href="#">로그아웃</a></h5>
	<h5><a href="#">회원탈퇴</a></h5>

</div>


<jsp:include page="/template/footer.jsp"></jsp:include>