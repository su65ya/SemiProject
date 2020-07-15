<%@page import="semi.beans.dto.SellerDto"%>
<%@page import="semi.beans.dao.SellerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String seller_id = request.getParameter("seller_id");

	SellerDao sdao = new SellerDao();
	SellerDto sdto = sdao.get(seller_id);
%>
<jsp:include page="/template/nav.jsp"></jsp:include>

<div align="center">
	<h2>판매자 정보 수정</h2>
	
	<form action="admin_seller_edit.do" method="post">
		<table border="1">
			<tbody>
				<tr>
					<th>아이디</th>
					<td>
						<%=sdto.getSeller_id() %>
						<input type="hidden" name="seller_id" value="<%=sdto.getSeller_id()%>">
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<input type="text" name="seller_pw" value="<%=sdto.getSeller_pw()%>" required>
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>
						<input type="text" name="seller_name" value="<%=sdto.getSeller_name()%>">
					</td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td>
						<input type="text" name="seller_birth" value="<%=sdto.getSeller_birthdayFormat()%>">
					</td>
				</tr>
				<tr>
					<th>메일</th>
					<td>
						<input type="text" name="seller_email" value="<%=sdto.getSeller_email()%>">
					</td>
				</tr>
				<tr>
					<th rowspan="3">주소</th>
					<td>
						<input type="text" name="seller_post" value="<%=sdto.getSeller_post()%>">
						<input type="button" value="찾기">
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" name="seller_basic_addr" value="<%=sdto.getSeller_basic_addr()%>">
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" name="seller_detail_addr" value="<%=sdto.getSeller_detail_addr()%>">
					</td>
				</tr>
				<tr>
					<th>폰번호</th>
					<td>
						<input type="text" name="seller_phone" value="<%=sdto.getSeller_phone()%>">
					</td>
				</tr>
				<tr>
					<th>사업자번호</th>
					<td>
						<input type="text" name="company_no" value="<%=sdto.getCompany_no() %>">
					</td>
				</tr>
				<tr>
					<th>가입일</th>
					<td><%=sdto.getSeller_join() %></td>
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