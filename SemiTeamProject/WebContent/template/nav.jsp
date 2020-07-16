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
<link rel="stylesheet" type="text/css" href="<%= root %>/css/base.css">
<link rel="stylesheet" href="<%= root %>/css/swiper.min.css">

	 <style>
    	.swiper-container {
            width: 100%;
            min-height: 500px;
            max-height: 500px;
        }
        
    </style>
    <script src="<%= root %>/js/swiper.min.js"></script>
    <script>
        
        // 창의 로딩이 완료되었을 때 실행할 코드를 예약
        window.onload = function() {
            // swiper 관련 코드를 이곳에 작성
            // var mySwiper = new Swiper(선택자(대상), 옵션);
            var mySwiper = new Swiper ('.swiper-container', {
                // Optional parameters
                direction: 'horizontal',
                loop: true,

                // If we need pagination
                pagination: {
                    el: '.swiper-pagination',
                },                
     
                grabCursor:true,

            });
        };
    </script>
    
</head>
<body>
	<main>
		<nav class="nav">
		<%if(!isLogin){//비로그인 상태 %>
			<ul class="menuu menuu-f menuu-fixed">
				<li><a href="<%= root %>/index.jsp">사이트명</a></li>
				<li><a href="<%= root %>/member/login.jsp">로그인</a></li>
				<li><a href="<%= root %>/admin/admin_login.jsp">관리자로그인</a></li>
				<li><a href="<%= root %>/member/join.jsp">회원가입</a></li>
				<li><a href="<%= root %>/seller/seller_login.jsp">펜션관리(판매자 로그인)</a></li>
				<li><a href="<%= root %>/admin/admin_login.jsp">업소관리(관리자 로그인)</a></li>
				<li><a href="<%= root %>/seller/code_no.jsp">입점신청(판매자 회원가입)</a></li>
				<li><a href="#">펜션 찾기</a></li>
			</ul>
		<%}else{%>
			<%if(adto!=null){//관리자면 %>
			<ul class="menuu menuu-f menuu-fixed">
				<li><a href="<%= root %>/index.jsp">사이트명(홈으로 가게 하는 사이트명)</a></li>
				<li><a href="<%= root %>/admin/info.jsp">내 정보</a></li>
				<li><a href="<%= root %>/admin/admin_logout.do">로그아웃</a></li>
				<li><a href="<%= root %>/admin/admin_seller_list.jsp">판매자 회원 관리</a></li>
				<li><a href="<%= root %>/admin/admin_member_list.jsp">사용자 회원관리</a></li>
				<li><a href="<%= root %>/admin/admin_count.jsp">통계보기</a></li>

			</ul>
			<%}else if(sdto !=null){//판매자면 %>
			<ul class="menuu menuu-f menuu-fixed">
				<li><a href="<%= root %>/index.jsp">사이트명(홈으로 가게 하는 사이트명)</a></li>
				<li><a href="<%= root %>/seller/seller_info.jsp">내 정보</a></li>
				<li><a href="<%= root %>/seller/seller_logout.do">로그아웃</a></li>
				<li><a href="<%= root %>/seller/pension_list.jsp">펜션관리</a></li>
			</ul>
			<%}else if(mdto !=null){//사용자면 %>
			<ul class="menuu menuu-f menuu-fixed">
				<li><a href="<%= root %>/index.jsp">사이트명(홈으로 가게 하는 사이트명)</a></li>
				<li><a href="<%= root %>/member/info.jsp">내 정보</a></li>
				<li><a href="<%= root %>/member/member_logout.do">로그아웃</a></li>
				<li><a href="<%= root %>/member/pension_list.jsp">펜션 찾기</a></li>
				<li><a href="<%= root %>/member/reservation_list.jsp?res_write=<%= mdto.getMember_no() %>">내 예약 보기</a></li>
			</ul>
			<%} %>
		<%} %>
<!-- 		<ul class="menuu"> -->
<!-- 				<li><a href="#">업소관리</a></li> -->
<!-- 				<li><a href="#">입점신청</a></li> -->
<!-- 				<li><a href="#">펜션 찾기</a></li> -->
<!-- 				<li><a href="#">내 예약 보기</a></li> -->
<!-- 			</ul> -->
		</nav>
		<section>
			<div class="row-empty"></div>
			<div class="row-empty"></div>
            <div class="row-empty"></div>
            <div class="row-empty"></div>
