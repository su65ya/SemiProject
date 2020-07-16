<%@page import="semi.beans.dto.SellerDto"%>
<%@page import="semi.beans.dao.SellerDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String type = request.getParameter("type");
	String keyword = request.getParameter("keyword");

	SellerDao sdao = new SellerDao();
	
	//타입과 키워드가 없다면
	List<SellerDto> list;
	if( type == null || keyword == null ) {
		list = sdao.search();
	}
	else {
		list = sdao.search(type, keyword);
	}
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
        	width : 120px;
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

<article class="w-50">
	<div class="row ">
		<h2>판매자 목록</h2>
	</div>
	<div class="row">
		<table class="table table-sideopen">
			<thead>
				<tr>
					<th>no</th>
					<th>사업자번호 </th>
					<th>아이디 </th>
					<th>이름</th>
					<th>상세정보</th>
				</tr>
				
			</thead>
			<tbody align="center" class="font_color_a">
				<%for(SellerDto sdto : list) {%>
				<tr>
					<th><%=sdto.getSeller_no()%></th>
					<th><%=sdto.getCompany_no() %></th>
					<th><%=sdto.getSeller_id() %></th>
					<th><%=sdto.getSeller_name()%></th>
					<th>
						<a href="admin_seller_detail.jsp?seller_id=<%=sdto.getSeller_id() %>">
							<input type="button" class="form-btn2" value="상세정보 보기">
						</a>
					</th>
				</tr>
				<%} %>
				
			</tbody>
		</table>
	</div>
</article>
	
	<!-- 검색창 -->
	<div align="center">
		<form action="admin_seller_list.jsp" method="get">
			<select name="type" >
				<option value="company_no">사업자번호</option>
				<option value="seller_id">아이디</option>
				<option value="seller_name">이름</option>
				<option value="seller_email">메일</option>
				<option value="seller_phone">폰번호</option>
				
			</select>
			<input type="text" name="keyword" required placeholder="검색어 입력" >
			<input type="submit" value="검색">
		</form>
	</div>

<jsp:include page="/template/footer.jsp"></jsp:include>