<%@page import="semi.beans.dto.SellerDto"%>
<%@page import="semi.beans.dao.SellerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%
	String seller_id = request.getParameter("seller_id");
	
	SellerDao sdao = new SellerDao();
	SellerDto sdto = sdao.get(seller_id);
%>

<style>
	    .form-input,.form-btn2,.form-btn3{
            width: 100%;
            padding: 0.5rem;
            outline: none;/*선택시 자동 부여되는 테두리 제거*/
            border: none;
    		border-radius: 5px;
        }
        .form-input:focus{
            border-color: #b2bec3;
        }
        .form-btn2{
        	background-color:#636e72;
        	width : 150px;
            color: white;
            cursor: pointer;
        }
        .form-btn3{
        	background-color:#ff7675;
        	width : 150px;
            color: white;
            cursor: pointer;
        }
        .form-btn2:hover,.form-btn3:hover {
        	background-color:#b2bec3;
        }
        .font_color_a {
        	color : #636e72;
        	font-style: normal;
        	font-size: 14px;
        }
</style>

<jsp:include page="/template/nav.jsp"></jsp:include>

<article class="w-40">
	<div class="row ">
		<h2>[<%=sdto.getSeller_name()%> (사업자번호 : <%=sdto.getCompany_no()%>)]님의<br> 회원정보</h2>
	</div>
	<div class="row">
		<table class="table table-sideopen table-hover">
			<tbody>
				<tr>
					<th>아이디</th>
					<td class="left font_color_a"><%=sdto.getSeller_id()%></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td class="left font_color_a"><%=sdto.getSeller_pw()%></td>
				</tr>
				<tr>
					<th>이름</th>
					<td class="left font_color_a"><%=sdto.getSeller_name()%></td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td class="left font_color_a"><%=sdto.getSeller_birthdayFormat()%></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td class="left font_color_a"><%=sdto.getSeller_email()%></td>
				</tr>
				<tr>
					<th rowspan="3">주소</th>
					<td class="left font_color_a">[<%=sdto.getSeller_post()%>]</td>
				</tr>
				<tr>
					<td class="left font_color_a"><%=sdto.getSeller_basic_addr()%></td>
				</tr>
				<tr>
					<td class="left font_color_a"><%=sdto.getSeller_detail_addr()%></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td class="left font_color_a"><%=sdto.getSeller_phone()%></td>
				</tr>
				<tr>
					<th>사업자번호</th>
					<td class="left font_color_a"><%=sdto.getCompany_no()%></td>
				</tr>
				<tr>
					<th>가입일</th>
					<td class="left font_color_a"><%=sdto.getJoin_day()%></td>
				</tr>
			</tbody>		
		</table>

	</div>
	<div class="row" style="float: left;">
		<a href="admin_seller_list.jsp">
			<input class= "form-btn2" type="button" value="◀ 판매자 리스트 ">
		</a>
	</div>
	<div class="row" style="float: right;">
		<a href="<%=request.getContextPath()%>/admin/admin_check.jsp?go=<%=request.getContextPath() %>/admin/sellerDrop.do?seller_id=<%=sdto.getSeller_id()%>">
			<input class= "form-btn3" type="button" value="판매자 탈퇴">
		</a>
	</div>
	<div class="row" style="float: right;">
		<a href="<%=request.getContextPath()%>/admin/admin_check.jsp?go=<%=request.getContextPath() %>/admin/admin_seller_edit.jsp?seller_id=<%=sdto.getSeller_id()%>">
			<input class= "form-btn2" type="button" value="판매자정보 수정">
		</a>
	</div>
	
	<div class="row-empty"></div> 
	
</article>


<jsp:include page="/template/footer.jsp"></jsp:include>