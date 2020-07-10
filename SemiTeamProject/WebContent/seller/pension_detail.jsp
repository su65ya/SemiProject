<%@page import="semi.beans.dao.PensionDao"%>
<%@page import="semi.beans.dto.PensionDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    PensionDao pdao = new PensionDao();
    int pension_no = Integer.parseInt(request.getParameter("pension_no"));
    PensionDto pdto = pdao.get(pension_no);
    	
    %>
<jsp:include page="/template/nav.jsp"></jsp:include>
<article class="w-50">
 		<div class="row">
 			<h2>펜션 상세정보</h2>
 		</div>
 		<div class="row">
 			<table class="table table-sideopen table-hover">
 				<tbody>
 				<tr>
 					<th>펜션번호 </th>
 					<td class="left"><%=pdto.getPension_no() %></td>
 				</tr>
 				<tr>
 					<th>펜션등록자</th>
 					<td class="left"><%=pdto.getPension_seller_no() %></td>
 				</tr>
 				<tr>
 					<th>펜션이름</th>
 					<td class="left"><%=pdto.getPension_name() %></td>
 				</tr>
 				<tr>
 					<th>펜션주소</th>
 					<td class="left">[<%=pdto.getPension_post() %>]
 						<%=pdto.getPension_basic_addr() %>
 						<%=pdto.getPension_detail_addr() %></td>
 				</tr>
 				<tr>
 					<th>펜션 소개</th>
 					<td class="left"><%=pdto.getPension_intro() %></td>
 				</tr>
 				<tr>
 					<th>팬션전화번호</th>
 					<td class="left"><%=pdto.getPension_phone() %></td>
 				</tr>
 				<tr>
 					<th>펜션 등록일</th>
 					<td class="left"><%=pdto.getPension_regist_date_day() %></td>
 				</tr>
 				
 			</tbody>
 			</table>
 		</div>
 		<div class="row-empty"></div>
 		<div class="row center a">
 			<a href = "#">수정하기</a>&nbsp;&nbsp;
 			<a href = "#">객실 등록</a>&nbsp;&nbsp;
 			<a href = "pension_delete.do?pension_no=<%=pension_no%>">펜션 삭제</a>&nbsp;&nbsp;
 			<a href = "pension_list.jsp">목록보기</a>
 		</div>
 	</article>

<jsp:include page="/template/footer.jsp"></jsp:include>