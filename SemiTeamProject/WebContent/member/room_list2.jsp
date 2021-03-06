<%@page import="semi.beans.dto.MemberDto"%>
<%@page import="semi.beans.dto.RoomImgViewDto"%>
<%@page import="semi.beans.dto.RoomImageDto"%>
<%@page import="semi.beans.dto.PensionInfoDto"%>
<%@page import="semi.beans.dto.PensionDto"%>
<%@page import="semi.beans.dao.PensionDao"%>
<%@page import="semi.beans.dto.RoomDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.dao.RoomDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
	th {
	color:white;
    background-color: 	#AB8364;
    
  }
  tbody tr:nth-child(2n+1) {
    background-color: 	#D9C3B2;
  }
	
  
  a {
  	text-decoration: none;
  }
  .tdstyle{
		width: 38px;
	}
			.form-input,.form-btn2,.form-btn3{
	    	width: 50%;
	        padding: 0.5rem;
	        outline: none;/*선택시 자동 부여되는 테두리 제거*/
	        border: none;
	    	border-radius: 5px;
	    }

</style>
<jsp:include page="/template/nav.jsp"></jsp:include>
<%
	
	PensionDao pdao = new PensionDao();
	RoomDao rdao = new RoomDao();
	int pension_no = Integer.parseInt(request.getParameter("pension_no"));
	
	List<RoomDto> list = rdao.getList(pension_no);
	PensionInfoDto pdto = pdao.get(pension_no);
	RoomImgViewDto rivdto = new RoomImgViewDto();

%>

<!-- 객실 목록 리스트 -->
<article class="w-60">
	<div class="row">
		<h2>객실 목록</h2>	
	</div>
	<!-- 객실 목록 -->
	<div class="row list">
		<table class="table table-sideopen">
			<thead>
				<tr>
					<th colspan="7">
<%-- 					<input type="hidden" name="pension_no" value="<%=(request.getParameter("pension_no"))%>"> --%>
					<%=pdto.getPension_name()%>
					</th>
				</tr>
			</thead>
			<tbody>
			<%for(RoomDto rdto : list){ %>
				<tr>
					<%rivdto = rdao.getImgView(rdto.getRoom_no()); 
					if(rivdto != null){%>
  					<td rowspan="8"  style="background-color:white"><img src="roomdownload.do?room_image_no=<%=rivdto.getRoom_image_no() %>" width="250" height="250"></td>
  					<%}else{ %>
					<td rowspan="8" style="background-color:white"><img src="https://placehold.it/250x250"></td>
					<%} %>
				</tr>
				<tr>
   					<td class="left" style="padding:0.7em">객실명 : <%=rdto.getRoom_name() %></td>
   				</tr>
				<tr>	
  					<td class="left" style="padding:0.7em">객실 유형 : <%=rdto.getRoom_type() %></td>
  				</tr>
				<tr>
    				<td class="left" style="padding:0.7em">인원 : 기준<%=rdto.getStandard_people() %>명 / 최대<%=rdto.getMax_people() %>명</td>
    			</tr>
				<tr>	
    				<td class="left" style="padding:0.7em">방평수 : <%=rdto.getRoom_width() %>형</td>
  				</tr>
				<tr>	
  					<td class="left" style="padding:0.7em">화장실개수 : <%=rdto.getToilet_count() %>개  </td>
  				</tr>
				<tr>	
  					<td class="left" style="padding:0.7em">
  						비수기 평일/주말가격 : <%=rdto.getOff_weekday() %>원 / <%=rdto.getOff_weekend() %>원<br>
  						성수기 평일/주말가격 : <%=rdto.getOn_weekday() %>원 / <%=rdto.getOn_weekend() %>원
  					</td>
  				</tr>
  				<tr>
    				<td class="row right" colspan="7" >
						<a href = "reservation_step1.do?pension_no=<%=pension_no%>">
							<input class = "tdstyle form-btn3 form-inline" type="button" value = "예약하기">
						</a>
					</td>
  				</tr>
  				<%} %>
			</tbody>
		</table>
		
		<!-- 객실 등록버튼 -->
		<div class='row-empty'></div>
		<div class='row right'>
			<a href = "pension_list.jsp">
				<input class = "tdstyle form-btn2 form-inline" type="button" value = "펜션목록">
			</a>	
		</div>
		
	</div>
	<!-- 네비게이터 -->
	<div class="row"></div>
	
</article>
<jsp:include page="/template/footer.jsp"></jsp:include>