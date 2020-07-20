<%@page import="semi.beans.dto.AdminDto"%>
<%@page import="semi.beans.dto.SellerDto"%>
<%@page import="semi.beans.dto.PensionImageDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.dao.PensionImageDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    SellerDto sdto = (SellerDto) session.getAttribute("sellerinfo");
    AdminDto adto = (AdminDto) session.getAttribute("admininfo");
    %>
    

<jsp:include page="/template/nav.jsp"></jsp:include>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/swiper.min.css" type="text/css">
	<style>
        .meinjpg {
            text-align: center;
        }

        .swiper-container {
            width: 1100px;

            justify-content: center;
        }

        * {
            box-sizing: border-box;

        }
        .opa{
        	opacity: 0.7;
        }
        .opa:hover{
        	opacity: 1;
        }
	
	</style>
	<script src="<%=request.getContextPath() %>/js/swiper.min.js"></script>
    <script>
        //창의 로딩이 완료되었을 때 실행할 코드를 예약
        window.addEventListener("load", function(){	
            //var mySwiper = new Swiper(선택자, 옵션);
            var mySwiper = new Swiper('.swiper-container', {
                //swiper에 적용할 옵션들을 작성

                direction: 'horizontal' //표시방식(수직:vertical, 수평:horizontal)
                    ,
                loop: true, //순환 모드 여부

                    //자동재생 옵션그룹
                    
                autoplay: {
                    delay: 1000 //자동재생 시간(1초)
                }

                //페이지 네비게이터 옵션그룹
                ,
                pagination: {
                    el: '.swiper-pagination', //적용 대상의 선택자
                    type: 'bullets', //네비게이터 모양(bullets/fraction/...)
                },

                //이전/다음 이동버튼 설정그룹
                navigation: {
                    nextEl: '.swiper-button-next',
                    prevEl: '.swiper-button-prev',
                }

                //커서 모양을 손모양으로 변경
                ,
                grabCursor: true

                    //슬라이드 전환 효과(effect)
                    //,effect:'coverflow'
                    //,effect:'cube'
                    //,effect:'fade'
                    //,effect:'flip'
                    ,
                effect: 'slide' //기본값
            });
        });

    </script>
	
		<article class="main">


                <!-- 이미지 슬라이더 영역 -->
                <div class="swiper-container">
                    <!-- 필수 영역 -->
                    <div class="swiper-wrapper">
                        <!-- 배치되는 이미지 또는 화면 -->
                        <div class="swiper-slide">
                        <% if (sdto != null) { %>                        
                        	<a href="<%=request.getContextPath() %>/seller/pension_list.jsp">
                        <%} else if(adto != null){ %>
                        	<a href="#">
                        <%} else {%>
                            <a href="<%=request.getContextPath() %>/member/pension_list.jsp">
                        <%} %>
                               <img alt="main"
						src="<%=request.getContextPath()%>/image/main11.jpg">
                            </a>
                        </div>
                        
                        <div class="swiper-slide">
                        <% if (sdto != null) { %>                        
                        	<a href="<%=request.getContextPath() %>/seller/pension_list.jsp">
                        <%} else if(adto != null){ %>
                        	<a href="#">
                        <%} else {%>
                            <a href="<%=request.getContextPath() %>/member/pension_list.jsp">
                        <%} %>
                                 <img alt="main"
						src="<%=request.getContextPath()%>/image/main_image1.jpg">
                            </a>
                        </div>
                        <div class="swiper-slide">
                        <% if (sdto != null) { %>                        
                        	<a href="<%=request.getContextPath() %>/seller/pension_list.jsp">
                        <%} else if(adto != null){ %>
                        	<a href="#">
                        <%} else {%>
                            <a href="<%=request.getContextPath() %>/member/pension_list.jsp">
                        <%} %>
                                 <img alt="main"
						src="<%=request.getContextPath()%>/image/down.jpg">
     
                            </a>
                        </div>

                    </div>
                    <!-- 페이지 위치 표시 영역(선택) -->
                    <div class="swiper-pagination"></div>


                </div>

                <div class="row-empty"></div>
                <div class="row-empty"></div>


            </article>
		    <jsp:include page="/template/Search.jsp"></jsp:include>			

		    
			<article class='hei'>
			    
			    <div class="row pen-float">
			    
                    <div class="pension1">
                       <a href="#" >
                            <img alt="main" class="opa"
						src="<%=request.getContextPath()%>/image/right.png">
                       </a>
                    </div>
                    
                    <div class="pen-left">
                       
                        <div class="pension2">
                           <a href="#">
                           <img alt="main" class="opa"
						src="<%=request.getContextPath()%>/image/pen1.jpg" style="width: 390px; height: 358px;">
                           
<!--                                <img src="http://placehold.it/390x358"> -->
                           </a>
                        </div>

                        <div class="pension3 opa">
                            <a href="#">
                           <img alt="main" class="opa"
						src="<%=request.getContextPath()%>/image/pen2.jpg" style="width: 390px; height: 358px;">
                            </a>
                        </div>
                       
                    </div>
                    
                    
                    <div class='pen-middle'>
                    
                        <div class="pension4">
                           <a href="#">
                                <img class="opa" alt="main"
						src="<%=request.getContextPath()%>/image/main22.jpg" style="width:400px; height: 246px;">
                            </a>
                        </div>

                        <div class="pension5">
                           <a href="#">
                                <img class="opa" alt="main"
						src="<%=request.getContextPath()%>/image/left.png">
                            </a>
                        </div>

                        <div class="pension6">
                           <a href="#">
                           <img alt="main" class="opa"
						src="<%=request.getContextPath()%>/image/main4.png" style="width:400px; height: 210px;">
<!--                                 <img src="http://placehold.it/400x210"> -->
                            </a>
                        </div>
                      
                    </div>
                    
			    </div>
			    	 
			</article>

			
<jsp:include page="/template/footer.jsp"></jsp:include>