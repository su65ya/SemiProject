<%@page import="semi.beans.dto.PensionImageDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.dao.PensionImageDao"%>
<%@page import="semi.beans.dto.PensionInfoDto"%>
<%@page import="semi.beans.dao.PensionDao"%>
<%@page import="semi.beans.dto.PensionDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    PensionDao pdao = new PensionDao();
    int pension_no = Integer.parseInt(request.getParameter("pension_no"));
//     PensionDto pdto = pdao.get(pension_no);//아이디 말고 번호로 뽑아냄
	PensionInfoDto pidto = pdao.get(pension_no);//아이디로 뽑아내기
	
	////////////////////////////////////////////////////////////////
	// 첨부파일 목록을 구해오는 코드
	////////////////////////////////////////////////////////////////
	PensionImageDao pidao = new PensionImageDao();
	List<PensionImageDto> fileList = pidao.getList(pension_no);
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
 					<td class="left"><%=pidto.getPension_no() %></td>
 				</tr>
 				<tr>
 					<th>펜션등록자</th>
 					<td class="left"><%=pidto.getSeller_id() %></td>
 				</tr>
 				<tr>
 					<th>펜션이름</th>
 					<td class="left"><%=pidto.getPension_name() %></td>
 				</tr>
 				<tr>
 					<th>펜션주소</th>
 					<td class="left">[<%=pidto.getPension_post() %>]
 						<%=pidto.getPension_basic_addr() %>
 						<%=pidto.getPension_detail_addr() %></td>
 				</tr>
 				<tr>
 					<th>펜션 소개</th>
 					<td class="left"><%=pidto.getPension_intro() %></td>
 				</tr>
 				<tr>
 					<th>팬션전화번호</th>
 					<td class="left"><%=pidto.getPension_phone() %></td>
 				</tr>
 				<tr>
 					<th>펜션 등록일</th>
 					<td class="left"><%=pidto.getPension_regist_date_day() %></td>
 				</tr>
 				<tr>
 					<th>펜션 사진</th>
 					<td class="left">
 						<%for(PensionImageDto pmdto : fileList){ %>
 						<img src="download.do?pen_image_no=<%=pmdto.getPen_image_no()%>" width="200" height="200">
 						<%} %>
 					</td>
 				</tr>
 			</tbody>
 			</table>
 		</div>
 		<div class="row-empty"></div>
 		<div class="row center a">
 			<a href = "<%=request.getContextPath() %>/seller/password_check.jsp?go=<%=request.getContextPath() %>/seller/pension_edit.jsp?pension_no=<%=pension_no%>">수정하기</a>&nbsp;&nbsp;
 			<a href = "room_regist.jsp">객실 등록</a>&nbsp;&nbsp;
 			<a href = "<%=request.getContextPath() %>/seller/password_check.jsp?go=pension_delete.do?pension_no=<%=pension_no%>">펜션 삭제</a>&nbsp;&nbsp;
 			<a href = "pension_list.jsp">목록보기</a>
 		</div>
 	</article>

<jsp:include page="/template/footer.jsp"></jsp:include>