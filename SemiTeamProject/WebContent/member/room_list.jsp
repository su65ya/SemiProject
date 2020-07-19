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

<jsp:include page="/template/nav.jsp"></jsp:include>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 <link rel="stylesheet" href="../css/swiper.min.css">
    <style>
    .swiper-container {
        width: 100%	;
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
        #map{
            width:400px;
            height:200px;
        }
        
    </style>
    
    <script src="../js/swiper.min.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=48c8a7138671a611cf1a659c1b4ac73b&libraries=services"></script>
	<script>
		window.addEventListener("load", function(){			
			var goAddr = document.querySelector("#goAddr").value;
			
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };  

			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 
			
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
			
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch(goAddr, function(result, status) {

			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {

			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        });

			        // 인포윈도우로 장소에 대한 설명을 표시합니다
			        var infowindow = new kakao.maps.InfoWindow({
			            content: '<div style="width:150px;text-align:center;padding:6px 0;">펜션위치</div>'
			        });
			        infowindow.open(map, marker);

			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    } 
			}); 
		});
		window.addEventListener("load", function(){	
// 			 swiper 관련 코드를 이곳에 작성
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
		});
        
//     /*
//     	알아야 할 명령
//     	.parentNode : 상위 태그 객체
//     	.previousSibling : 
//     */
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
		
		</script>
<%

	int reservation_no = Integer.parseInt(request.getParameter("reservation_no"));
	PensionDao pdao = new PensionDao();
	RoomDao rdao = new RoomDao();
	int pension_no = Integer.parseInt(request.getParameter("pension_no"));
	
	List<RoomDto> list = rdao.getList(pension_no); 
	PensionInfoDto pdto = pdao.get(pension_no);
	String addr = pdto.getPension_basic_addr();
	PensionImageDao pidao = new PensionImageDao();
	
	List<PensionImageDto> fileList = pidao.getList(pension_no);
	
	PenImgViewDto viewDto = new PenImgViewDto();
	
	MemberDto mdto = (MemberDto)session.getAttribute("userinfo");

	Calendar cal = Calendar.getInstance();
	SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd");
	SimpleDateFormat yearWithformat = new SimpleDateFormat("yyyy/MM/dd");
	ReservationDao rvdao = new ReservationDao();
%>
	<input type="hidden" value="<%=addr%>" id="goAddr">
    <div class="swiper-container center">
        <div class="swiper-wrapper">
                <%for(PensionImageDto pmdto : fileList){ %>
            <div class="swiper-slide">
 						<img src="download.do?pen_image_no=<%=pmdto.getPen_image_no()%>" width="1100" height="500">
            </div>
 				<%} %>
            <div class="swiper-slide">
                <img src ="https://placeimg.com/1100/500/people">
            </div>
            <div class="swiper-slide">
                <img src = "https://placeimg.com/1100/500/animal">
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
    <div class="row-empty"></div>
    <div class="row-empty"></div>
    <div class="row-empty"></div>
    <form action="reservation_step2.do" method="post">
    <article class="w-80">

    <div class="float-box">
	    <div class="row left float-right" style=" width: 40%;">
	        <div class="row left">
        <h1 style="height: 15px; font-weight: bolder;" class="left"><%=pdto.getPension_name() %></h1>
        <input type = "hidden" name = "reservation_no" value = "<%=reservation_no%>">
	    </div>
	    <div class="row left">
	        <h5 class="left" style="height: 15px; margin: 0;">[<%=pdto.getPension_post() %>] <%=pdto.getPension_basic_addr() %> <%=pdto.getPension_detail_addr() %></h5>
	    </div>
	       <dl>
	           <dt>예약문의</dt>
	           <dd><%=pdto.getPension_phone() %></dd>
	           <dt>입/퇴실안내</dt>
	           <dd>이용/시설 안내 참조</dd>
	           <dt>판매가</dt>
	           <dd><%=rdao.minPrice(pension_no) %>~<%=rdao.maxPrice(pension_no) %></dd>
	           <dt>펜션 소개글</dt><br>
	           <dd><%=pdto.getPension_intro() %></dd>
	       </dl>
	        
	    </div> 
		<div>
	    	 <div id="map" style="width:55%; height:450px;"></div>
	    </div>
    </div>
    <div class="row-empty"></div>
    <div class="row-empty"></div>
    <div> 
    	<h4  class="left">"먼저 아래 달력에서 예약할 객실을 선택하고 예약하기를 눌러주세요."</h4>
    </div>
    <div class="center" style="margin-left: -30px;">
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
		                    		<div><h5 style="font-size: 4px; color:red;">예약완료</h5></div>
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