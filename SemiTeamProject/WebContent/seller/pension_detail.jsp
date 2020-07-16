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
 <link rel="stylesheet" href="../css/swiper.min.css">
    <style>
    .swiper-container {
        width: 200px;	;
        height: 500px;
    }
        dl>dt, dl>dd{
            font-size: 12px;
            font-weight: 800;
            color: dimgrey;
        }
        dt{
             width: 150px;
            float: left;
        }
    </style>

<script>
        //창의 로딩이 완료되었을 때 실행할 코드를 예약
        window.onload=function(){
                //swiper 관련 코드를 이곳에 작성
                //var mySwiper = new Swiper(선택지,옵션);
                var mySwiper = new Swiper ('.swiper-container', {
                // swiper에 적용할 옵션들
                direction: 'horizontal',//표식방식(수직:vertical,수평:horizontal)
                loop: true,//순환 모드 여부 (마지막과 처음이 이어지는 것)
                //자동재생 옵션그룹
                autoplay:{
                    delay:1000 //자동재생 (1초)
                },
                
                // 페이지 네비게이터 옵션그룹
                pagination: {
                    el: '.swiper-pagination',//적용 대상의 선택자
                    type:'bullets',//네비게이터 모양(custom,progressbar,fraction,bullets(기본값))
                },

                navigation: {
                    nextEl: '.swiper-button-next',//이전버튼
                    prevEl: '.swiper-button-prev'//다음버튼
                },
                    
                grabCursor:true,
                
                effect :'slide',//기본값

                });
            
        }
</script>
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
					    <div class="swiper-container center">
					        <div class="swiper-wrapper">
					               <%for(PensionImageDto pmdto : fileList){ %>
					            <div class="swiper-slide">
					 				<img src="download.do?pen_image_no=<%=pmdto.getPen_image_no()%>" width="422" height="518">
					            </div>
					 				<%} %>
					            <div class="swiper-slide">
					                <img src ="https://placeimg.com/200/200/people">
					            </div>
					            <div class="swiper-slide">
					                <img src = "https://placeimg.com/200/200/animal">
					            </div>
					        </div>
					        <!-- 페이지 위치 표시 영역(선택) -->
					        <div class="swiper-pagination"></div>
					 
					<!--
					         이전/다음 버튼 (선택) 
					        <div class="swiper-button-prev"></div>
					        <div class="swiper-button-next"></div>
					-->
					    </div>
 					
<%--  						<%for(PensionImageDto pmdto : fileList){ %> --%>
<%--  						<img src="download.do?pen_image_no=<%=pmdto.getPen_image_no()%>" width="200" height="200"> --%>
<%--  						<%} %> --%>
 					</td>
 				</tr>
 			</tbody>
 			</table>
 		</div>
 		<div class="row-empty"></div>
 		<div class="row center a">
 			<a href = "<%=request.getContextPath() %>/seller/password_check.jsp?go=<%=request.getContextPath() %>/seller/pension_edit.jsp?pension_no=<%=pension_no%>">수정하기</a>&nbsp;&nbsp;
 			<a href = "room_regist.jsp?pension_no=<%= pension_no %>">객실 등록</a>&nbsp;&nbsp;
 			<a href = "<%=request.getContextPath() %>/seller/password_check.jsp?go=pension_delete.do?pension_no=<%=pension_no%>">펜션 삭제</a>&nbsp;&nbsp;
 			<a href = "pension_list.jsp">목록보기</a>&nbsp;&nbsp;
 			<a href = "<%= request.getContextPath() %>/question/question_list.jsp?que_pension_no=<%= pension_no %>">문의내역</a>
 		</div>
 	</article>

<jsp:include page="/template/footer.jsp"></jsp:include>