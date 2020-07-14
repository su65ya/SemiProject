<%@page import="semi.beans.dto.PenImgViewDto"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="semi.beans.dto.PensionImageDto"%>
<%@page import="semi.beans.dao.PensionImageDao"%>
<%@page import="semi.beans.dto.PensionInfoDto"%>
<%@page import="semi.beans.dto.PensionDto"%>
<%@page import="semi.beans.dao.PensionDao"%>
<%@page import="semi.beans.dto.RoomDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.dao.RoomDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>


</style>
<jsp:include page="/template/nav.jsp"></jsp:include>
 <link rel="stylesheet" href="../css/swiper.min.css">
    <style>
    .swiper-container {
        width: 600px;
        height: 300px;
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
    
    <script src="../js/swiper.min.js"></script>
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
<%
	PensionDao pdao = new PensionDao();
	RoomDao rdao = new RoomDao();
	int pension_no = Integer.parseInt(request.getParameter("pension_no"));
	
	List<RoomDto> list = rdao.getList(pension_no);
	PensionInfoDto pdto = pdao.get(pension_no);
	
	PensionImageDao pidao = new PensionImageDao();
	List<PensionImageDto> fileList = pidao.getList(pension_no);
	
	Calendar cal = Calendar.getInstance();
	SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd");

	
	PenImgViewDto viewDto = new PenImgViewDto();
	
%>

    <div class="swiper-container">
        <div class="swiper-wrapper">
            <div class="swiper-slide">
                <img src ="https://placeimg.com/600/300/animal">
            </div>
            <div class="swiper-slide">
                <img src ="https://placeimg.com/600/300/people">
            </div>
            <div class="swiper-slide">
                <img src = "https://placeimg.com/600/300/tech">
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
    <article class="w-80">
    <div class="row left">
        <h2 style="height: 15px;" class="left"><%=pdto.getPension_name() %></h2>
    </div>
    <div class="row left">
        <h6  class="left" style="height: 15px; margin: 0;">[<%=pdto.getPension_post() %>] <%=pdto.getPension_basic_addr() %> <%=pdto.getPension_detail_addr() %></h6>
    </div><hr style="width:100%; border: 1px solid gray;">

    <div class="row left">
       <dl>
           <dt>예약문의</dt>
           <dd><%=pdto.getPension_phone() %></dd>
           <dt>입/퇴실안내</dt>
           <dd>이용/시설 안내 참조</dd>
           <dt>판매가</dt>
           <dd><%=rdao.minPrice(pension_no) %>~<%=rdao.maxPrice(pension_no) %></dd>
       </dl>
        
    </div>
    
    <div class="center">
        <table class="table table-border center">
            <thead>
                <tr>
                    <th style="width: 90px;">객실</th>
                	<%for(int i = 0;i<14;i++){
                    	cal.add(cal.DATE,+i);
                    	String date111 = dateFormat.format(cal.getTime());
                    	cal = Calendar.getInstance();%>
                    <th>
                    <%=date111 %>
                    </th>
                    <%}%>
                </tr>
            </thead>
            <tbody>
                <%for(RoomDto rdto : list){%>
		                <tr>
		                    <td rowspan="2" style="width: 90px; padding: 0;"><img src="https://placehold.it/90x90"></td>
		                    <%for(int j = 0;j<14;j++){ %>
		                    	<td style="height: 60px;"><%=rdto.getOff_weekday() %></td>
		                    <%} %>
		                </tr>
               		 <tr>
                	<%for(int i = 0;i<14;i++){%>
<!--                 		<td></td> -->
<%--                 		<%if(예약된 객실이 아니면){ %> --%>
                    		<td style="height: 30px;"><input type="checkbox" ></td>
<%--                     	<%}else{예약된 객실이면 %> --%>
<!--                     		<td style="height: 2px;"><h6 >예약 완료</h6></td> -->
<%--                     	<%} %> --%>
                    <%} %>
                </tr>
                <%}%>
            </tbody>
        </table>
        
    </div>
    </article>
<jsp:include page="/template/footer.jsp"></jsp:include>