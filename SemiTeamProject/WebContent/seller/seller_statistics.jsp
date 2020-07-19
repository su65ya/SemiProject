<%@page import="semi.util.DateChecker"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.dto.SellerDto"%>
<%@page import="semi.beans.dto.SellerStatisticsDto"%>
<%@page import="semi.beans.dao.SellerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
SellerDao sdao = new SellerDao();
SellerDto sdto = (SellerDto)session.getAttribute("sellerinfo");
List<SellerStatisticsDto> list = sdao.getMonthlyPrice(sdto.getSeller_no());
%>
<jsp:include page="/template/nav.jsp"></jsp:include>
<style>
	.form-btn2,.form-btn3{
	    	width: 10%;
	        padding: 0.5rem;
	        outline: none;/*선택시 자동 부여되는 테두리 제거*/
	        border: none;
	    	border-radius: 5px;
	    }
</style>
	<article class="w-80">
			<div  class="row" style="height: 50px; text-align: center; font-size:120; font-weight: bold;color: #795548">
				<h2>펜션 별 통계 보기</h2>
			</div>
			<div class="row">
				<table class="table table-border">
			            <tbody>
			            	
			                <tr>
			                    <th>펜션 이름</th>
			                    <th>예약 날짜</th>
			                    <th>예약 건수</th>
			                    <th>총 매출</th>
			                </tr>
			                <%for(SellerStatisticsDto ssdto : list){ %>
			                <tr>
			                    <td><%=ssdto.getPension_name() %></td>
			                    <td><%=ssdto.getRes_date() %></td>
			                    <td><%=ssdto.getCnt() %>건</td>
			                    <td><%=DateChecker.cal(ssdto.getSum_price()) %>원</td>
			                 </tr>
			               <%} %>
			            </tbody>
				</table>
				<div class="row">
					<a href = "<%=request.getContextPath()%>/seller/pension_list.jsp"><button class="form-btn2 center" style="float: right;">펜션목록</button></a>
				</div>
			</div>
	</article>
<jsp:include page="/template/footer.jsp"></jsp:include>