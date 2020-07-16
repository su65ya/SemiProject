<%@page import="semi.beans.dao.SellerDao"%>
<%@page import="semi.beans.dto.SellerDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
    SellerDto sdto = (SellerDto) session.getAttribute("sellerinfo");
 	
	int seller_no = sdto.getSeller_no();
	SellerDao sdao = new SellerDao();
	SellerDto seller = sdao.get(seller_no);
 	
 	
 %>
 
<jsp:include page="/template/nav.jsp"></jsp:include>

<style>

	a {
    	text-decoration: none;
    }

    
    .form-btn {
    	border: none;
    	border-radius: 5px;
    }
    
</style>

<article class="w-45">

	<div class="row">
		<h2>판매자정보</h2>
	</div>
		
		<div class="row-empty"></div>
	
		<table class='table table-sideopen'>
			<tbody>
				<tr>
					<th width="30%">아이디</th>
					<td class='left'><%= seller.getSeller_id() %></td>
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
					<td class='left'><%= seller.getSeller_name() %></td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td class='left'><%= seller.getSeller_day()%></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td class='left'><%= seller.getSeller_email() %></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td class='left'><%= seller.getSeller_phone() %></td>
				</tr>
				<tr>
					<th rowspan="3">주소</th>
					<td class='left'>
						<%= seller.getSeller_post() %>
					</td>
				</tr>
				<tr>
					<td class='left'>
						<%= seller.getSeller_basic_addr() %>
					</td>
				</tr>
				<tr>
					<td class='left'>
						<%= seller.getSeller_detail_addr() %>
					</td>
				</tr>
				<tr>
					<th>사업자번호</th>
					<td class='left'><%= seller.getCompany_no() %></td>
				</tr>
				<tr>
					<th>가입일</th>
					<td class='left'><%= seller.getJoin_day() %></td>
				</tr>
			</tbody>
		
		</table>
		
		<div class='row-empty'></div>
		
		<div class='right'>
			<a href="change_info.jsp">
				<input class="form-btn form-inline" type="button" value="정보변경">
			</a>
			<a href="seller_logout.do">
				<input class="form-btn form-inline" type="button" value="로그아웃">
			</a>
			<a href="<%= request.getContextPath() %>/seller/password_check.jsp?go=<%= request.getContextPath() %>/seller/exit.do">
				<input class="form-btn form-inline" type="button" value="회원탈퇴">
			</a>
		</div>
			
</article>



<jsp:include page="/template/footer.jsp"></jsp:include>