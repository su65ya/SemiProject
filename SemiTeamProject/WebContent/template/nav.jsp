<%@page import="semi.beans.dto.AdminDto"%>
<%@page import="semi.beans.dto.SellerDto"%>
<%@page import="semi.beans.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
   <%
      String root = request.getContextPath();
      MemberDto mdto = (MemberDto)session.getAttribute("userinfo");//다운캐스팅(down-casting)
      SellerDto sdto = (SellerDto)session.getAttribute("sellerinfo");
      AdminDto adto = (AdminDto)session.getAttribute("admininfo");
      boolean isLogin = mdto != null || sdto!=null || adto !=null;
   %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>

<link rel="stylesheet" type="text/css" href="<%= root %>/css/menubar.css">
<link rel="stylesheet" type="text/css" href="<%= root %>/css/base.css">
<link rel="stylesheet" href="<%= root %>/css/swiper.min.css">


	 <style>
	 
    	.swiper-container {
    		z-index: -1;
            width: 100%;
            min-height: 500px;
            max-height: 500px;
        }
         @font-face {
            font-family: Jalnan;
            src: url("<%= root %>/font/Jalnan.ttf");
        }
        ul > li > a {
           font-family: Jalnan.ttf;
           !important;
        }
        
        .modal-wrap{
           display: none;
        }

        .modal-wrap.on{
           z-index: 8000;
           display: block;
        }
        .form-btn.login{
           height: 55px;
         radius:30%;
            font-size: 16px;
            font-weight: 900;
           background-color: darkslategray;
        }
        .form-btn.login:hover{
           background-color: #b2bec3;
            
        }
        .center{
           margin-top: 50px;
            margin-left: 30px;
            margin-right: 30px;
            padding: 0.3rem;
        }

        .siteName{
           float: left;
        }
        
        .highlightTextOut a:hover {
        	color:white;
        }
        
        
    </style>
    <script src="<%= root %>/js/swiper.min.js"></script>
    <script>
        
        
        function remove_modal() {
         var modal = document.querySelector(".modal-wrap");
         modal.classList.remove("on");
      }
        function add_modal() {
         var modal = document.querySelector(".modal-wrap");
         modal.classList.add("on");
      }
    </script>
    
</head>
<body>

   <main style="margin-top:">
    <div class = "modal-wrap">
        <div class="modal">
             <div class="row center" style="height: 55px;">
            <a href="<%=request.getContextPath() %>/member/login.jsp">
                <input class="form-btn login" type = "button" value = "사용자" onclick="remove_modal();">
            </a>
            </div>
             <div class="row center">
            <a href="<%=request.getContextPath() %>/seller/seller_login.jsp">
                <input class="form-btn login" type = "button" value = "판매자" onclick="remove_modal();">
            </a>
            </div>
             <div class="row center">
            <a href="<%=request.getContextPath() %>/admin/admin_login.jsp">
                <input class="form-btn login" type = "button" value = "관리자" onclick="remove_modal();">
            </a>
            </div>
        </div>
            <!--원하는 화면을 구성 : 로그인 , 로딩이미지,,-->
    </div>
		<nav class="nav">
		<%if(!isLogin){//비로그인 상태 %>
					<ul class="menuu menuu-f menuu-fixed container brown highlightTextOut">
				<li class="siteName" style="padding-top: 8px;"><a href="<%= root %>/index.jsp">

				<img alt="main"
						src="<%=request.getContextPath()%>/image/main.png"
						style="padding-top:0px; width: 200px; display: inline">

				</a></li>
				<li><a onclick="add_modal();">로그인</a></li>
				<li><a href="<%= root %>/member/join.jsp">회원가입</a></li>
				<li><a href="<%= root %>/seller/code_no.jsp">입점신청</a></li>
				<li><a href="<%= root %>/member/pension_list.jsp"">펜션 찾기</a></li>
			</ul>
		<%}else{%>

			<%if(adto!=null){//관리자면 %>
			<ul class="menuu menuu-f menuu-fixed container brown highlightTextOut">
				<li class="siteName"><a href="<%= root %>/index.jsp"><img alt="main"
						src="<%=request.getContextPath()%>/image/main.png"
						style="padding-top:0px; width: 200px; display: inline"></a></li>
				<li><a href="<%= root %>/admin/info.jsp">내 정보</a></li>
				<li><a href="<%= root %>/admin/admin_logout.do">로그아웃</a></li>
				<li><a href="<%= root %>/admin/admin_seller_list.jsp">판매자 회원 관리</a></li>
				<li><a href="<%= root %>/admin/admin_member_list.jsp">사용자 회원관리</a></li>
				<li><a href="<%= root %>/admin/admin_count.jsp">통계보기</a></li>

			</ul>
			<%}else if(sdto !=null){//판매자면 %>
			<ul class="menuu menuu-f menuu-fixed container brown highlightTextOut">
				<li class="siteName"><a href="<%= root %>/index.jsp"><img alt="main"
						src="<%=request.getContextPath()%>/image/main.png"
						style="padding-top:0px; width: 200px; display: inline"></a></li>
				<li><a href="<%= root %>/seller/seller_info.jsp">내 정보</a></li>
				<li><a href="<%= root %>/seller/seller_logout.do">로그아웃</a></li>
				<li><a href="<%= root %>/seller/pension_list.jsp">펜션관리</a></li>
				<li><a href="<%= root %>/seller/seller_statistics.jsp">통계보기</a></li>
			</ul>
			<%}else if(mdto !=null){//사용자면 %>
			<ul class="menuu menuu-f menuu-fixed container brown highlightTextOut">
				<li class="siteName"><a href="<%= root %>/index.jsp"><img alt="main"
						src="<%=request.getContextPath()%>/image/main.png"
						style="padding-top:0px; width: 200px; display: inline"></a></li>
                <li><a href="<%= root %>/member/info.jsp">내 정보</a></li>
               <li><a href="<%= root %>/member/member_logout.do">로그아웃</a></li>
                <li><a href="<%= root %>/member/pension_list.jsp" >펜션 찾기</a></li>
                <li><a href="<%= root %>/member/reservation_list.jsp?res_write=<%= mdto.getMember_no() %>">내 예약 보기</a></li> 
         </ul>
         <%} %>
      <%} %>
<!--       <ul class="menuu"> -->
<!--             <li><a href="#">업소관리</a></li> -->
<!--             <li><a href="#">입점신청</a></li> -->
<!--             <li><a href="#">펜션 찾기</a></li> -->
<!--             <li><a href="#">내 예약 보기</a></li> -->
<!--          </ul> -->
      </nav>
      <section>
      <div style="height: 150px;"></div>

                  