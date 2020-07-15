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

<article class="w-50">
	<div class="row">
		<h2>[<%=sdto.getSeller_name()%> (사업자번호 : <%=sdto.getCompany_no()%>)]님의 회원정보</h2>
	</div>
	<div class="row">
		<table class="table table-sideopen table-hover">
			<tbody>
				<tr>
					<th>아이디</th>
					<td class="left"><%=sdto.getSeller_id()%></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td class="left"><%=sdto.getSeller_pw()%></td>
				</tr>
				<tr>
					<th>이름</th>
					<td class="left"><%=sdto.getSeller_name()%></td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td class="left"><%=sdto.getSeller_birthdayFormat()%></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td class="left"><%=sdto.getSeller_email()%></td>
				</tr>
				<tr>
					<th>주소</th>
					<td class="left">
						[<%=sdto.getSeller_post()%>]
						<%=sdto.getSeller_basic_addr()%>
						<%=sdto.getSeller_detail_addr()%>
					</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td class="left"><%=sdto.getSeller_phone()%></td>
				</tr>
				<tr>
					<th>사업자번호</th>
					<td class="left"><%=sdto.getCompany_no()%></td>
				</tr>
				<tr>
					<th>가입일</th>
					<td class="left"><%=sdto.getSeller_join()%></td>
				</tr>
			</tbody>		
		</table>

	</div>
	<div class="row" style="float: left;">
		<a href="admin_seller_list.jsp">
			<input class= "form-btn" style="width: 150px;" type="button" value="◀판매자 리스트">
		</a>
	</div>
	<div class="row" style="float: right;">
		<a href="<%=request.getContextPath()%>/admin/admin_check.jsp?go=<%=request.getContextPath() %>/admin/sellerDrop.do?seller_id=<%=sdto.getSeller_id()%>">
			<input class= "form-btn" style="width: 150px;" type="button" value="판매자 탈퇴">
		</a>
	</div>
	<div class="row" style="float: right;">
		<a href="<%=request.getContextPath()%>/admin/admin_check.jsp?go=<%=request.getContextPath() %>/admin/admin_seller_edit.jsp?seller_id=<%=sdto.getSeller_id()%>">
			<input class= "form-btn" style="width: 150px;" type="button" value="판매자정보 수정">
		</a>
	</div>
	
	<div class="row-empty"></div> 
	
</article>


<jsp:include page="/template/footer.jsp"></jsp:include>