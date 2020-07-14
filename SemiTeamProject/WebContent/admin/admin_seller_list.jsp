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
<jsp:include page="/template/nav.jsp"></jsp:include>

<div align="center">
	<h2>판매자목록</h2>
	
	<table border="1" width="650">
		<thead>
			<tr>
				<th>no</th>
				<th>사업자번호 </th>
				<th>아이디 </th>
				<th>이름</th>
				<th>상세정보</th>
			</tr>
			
		</thead>
		<tbody align="center">
			<%for(SellerDto sdto : list) {%>
			<tr>
				<th><%=sdto.getSeller_no()%></th>
				<th><%=sdto.getCompany_no() %></th>
				<th><%=sdto.getSeller_id() %></th>
				<th><%=sdto.getSeller_name()%></th>
				<th>
					<a href="">
						<input type="button" value="상세정보보기">
					</a>
				</th>
			</tr>
			<%} %>
			
		</tbody>
	</table>

	
	<!-- 검색창 -->
	<form action="admin_seller_list.jsp" method="get">
		<select name="type">
			<option value="company_no">사업자번호</option>
			<option value="seller_id">아이디</option>
			<option value="seller_name">이름</option>
			<option value="seller_email">메일</option>
			<option value="seller_phone">폰번호</option>
			
		</select>


		<input type="text" name="keyword" required placeholder="검색어 입력" >
		<input type="submit" value="검색">
	</form>
	
	<hr>
	
	<h4>총 <%= list.size() %>개의 데이터 발견</h4>
	
	
</div>




<jsp:include page="/template/footer.jsp"></jsp:include>