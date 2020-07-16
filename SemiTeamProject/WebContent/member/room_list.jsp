<%@page import="semi.beans.dao.ReservationDao"%>
<%@page import="semi.beans.dto.MemberDto"%>
<%@page import="semi.util.DateChecker"%>
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
        
        /*
        	알아야 할 명령
        	.parentNode : 상위 태그 객체
        	.previousSibling : 
        */
        function reservation(tag) {//tag는 변화된 태그 객체(this)
        	var td = tag.parentNode;
        	var friendTd = td.previousElementSibling;
        	var re_infoTag = friendTd.children[0];

        	if(tag.checked){
        		var re_info = friendTd.children[1];
        		re_infoTag.value = re_info.value;
        	}else{
        		re_infoTag.value = "";
        	}
        	}
        
        function option_modal(){
        	var tag = document.querySelector(".modal-wrap");
        	tag.classList.remove("on");
        	tag.classList.add("on");
        }
        function option_modal_hidden(){
        	var tag = document.querySelector(".modal-wrap");
        	tag.classList.remove("on");
        }
        
        function change_check() {
			var tag = document.querySelector("#fire");
			var hidden = document.querySelector("input[name=fire]");
			
			if(tag.checked){
				hidden.value = "1";
			}else{
				hidden.value = "0";
			}
			
		}
    </script>
<%

	int reservation_no = Integer.parseInt(request.getParameter("reservation_no"));
	PensionDao pdao = new PensionDao();
	RoomDao rdao = new RoomDao();
	int pension_no = Integer.parseInt(request.getParameter("pension_no"));
	
	List<RoomDto> list = rdao.getList(pension_no); 
	PensionInfoDto pdto = pdao.get(pension_no);
	
	PensionImageDao pidao = new PensionImageDao();
	List<PensionImageDto> fileList = pidao.getList(pension_no);
	

	
	PenImgViewDto viewDto = new PenImgViewDto();
	
	MemberDto mdto = (MemberDto)session.getAttribute("userinfo");

	Calendar cal = Calendar.getInstance();
	SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd");
	SimpleDateFormat yearWithformat = new SimpleDateFormat("yyyy/MM/dd");
	ReservationDao rvdao = new ReservationDao();
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
    
    <form action="reservation_step2.do" method="post">
    <article class="w-80">
    <div class="row left">
        <h2 style="height: 15px;" class="left"><%=pdto.getPension_name() %></h2>
        <input type = "hidden" name = "reservation_no" value = "<%=reservation_no%>">
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
    <div class="row-empty"></div>
    <div class="row-empty"></div>
    <div> 
    	<h4  class="left">"먼저 아래 달력에서 예약할 객실을 선택하고 하단의 옵션에서 인원을 입력 후 예약하기를 눌러주세요."</h4>
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
                <%cal = Calendar.getInstance(); %>
		                <tr>
		                    <td style="width: 90px; padding: 0;"><img src="https://placehold.it/100x120"></td>
		                    <%for(int j = 0;j<14;j++){ %>
		                    <% 
		                    
		                    if(j > 0) cal.add(Calendar.DATE, 1);
		                    String date = yearWithformat.format(cal.getTime());
		                    %>
		                    <td>
			                    	<div style="height: 70px; text-align: center; padding-top: 1.5rem;"><%=DateChecker.calculatePriceWithFormat(cal, rdto)%>
			                    	<input type="hidden" name="res_info">
			                    	<input type="hidden" id="re_info" value="<%=rdto.getRoom_no() %>/<%=DateChecker.year(cal) %>/<%=DateChecker.month(cal) %>/<%=DateChecker.day(cal)%>/<%=DateChecker.calculatePrice(cal, rdto)%>">
			                    	
			                    	</div>
		                    	<%if(rvdao.isReservation(rdto.getRoom_no(), date)){ %>
		                    		<div><h5>예약완료</h5></div>
		                    	<%}else{ %>
			                    	 <div>
			                    	<input type="checkbox" onchange="reservation(this);">
			            			</div>
		                  		<%} %>
		                    </td>
			               <%} %>
		                    
		              </tr>
                <%}%>
            </tbody>
        </table>
        <div class="row-empty"></div>
        <div class="row-empty"></div>
        <div class="row-empty"></div>
        <div class="row">
        	<input type = "submit" value = "선택완료">
        </div>
    </div>
    </article>
    </form>
<jsp:include page="/template/footer.jsp"></jsp:include>