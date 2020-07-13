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
	<style>

    </style>
</head>
<body test>
	<main>
		<nav>
		<%if(!isLogin){//비로그인 상태 %>
			<ul class="menuu">
				<li><a href="<%= root %>/index.jsp">사이트명</a></li>
				<li><a href="<%= root %>/member/login.jsp">로그인</a></li>
				<li><a href="<%= root %>/admin/admin_login.jsp">관리자로그인</a></li>
				<li><a href="<%= root %>/member/join.jsp">회원가입</a></li>
				<li><a href="<%= root %>/seller/pension_list.jsp">펜션관리(판매자 로그인)</a></li>
				<li><a href="<%= root%>/admin/admin_login.jsp">업소관리(관리자 로그인)</a></li>
				<li><a href="<%=root %>/seller/code_no.jsp">입점신청(판매자 회원가입)</a></li>
				<li><a href="#">펜션 찾기</a></li>
			</ul>
		<%}else{%>
			<%if(adto!=null){//관리자면 %>
			<ul class="menuu">
				<li><a href="<%= root %>/index.jsp">사이트명(홈으로 가게 하는 사이트명)</a></li>
				<li><a href="<%= root %>/admin/info.jsp">내 정보</a></li>
				<li><a href="<%= root %>/admin/admin_logout.do">로그아웃</a></li>
				<li><a href="#">판매자 회원 관리</a></li>
				<li><a href="#">사용자 회원관리</a></li>
				<li><a href="#">통계보기</a></li>
			</ul>
			<%}else if(sdto !=null){//판매자면 %>
			<ul class="menuu">
				<li><a href="<%= root %>/index.jsp">사이트명(홈으로 가게 하는 사이트명)</a></li>
				<li><a href="<%= root %>/seller/info.jsp">내 정보</a></li>
				<li><a href="<%= root %>/seller/seller_logout.do">로그아웃</a></li>
				<li><a href="<%= root %>/seller/pension_list.jsp">펜션관리</a></li>
			</ul>
			<%}else if(mdto !=null){//사용자면 %>
			<ul class="menuu">
				<li><a href="<%= root %>/index.jsp">사이트명(홈으로 가게 하는 사이트명)</a></li>
				<li><a href="<%= root %>/member/info.jsp">내 정보</a></li>
				<li><a href="<%= root %>/member/member_logout.do">로그아웃</a></li>
				<li><a href="<%= root %>/member/search_pension_list.jsp">펜션 찾기</a></li>
				<li><a href="<%= root %>/member/reservation_list.jsp?res_write=<%= mdto.getMember_no() %>">내 예약 보기</a></li>
			</ul>
			<%} %>
		<%} %>
		<section>
			<div class="row-empty"></div>
			<div class="row-empty"></div>
