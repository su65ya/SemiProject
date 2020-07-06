<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/base.css">
	<style>
    </style>
</head>
<body test>
	<main>

		<nav>
			<ul class="menuu">
				<li><a href="<%=request.getContextPath() %>/index.jsp">사이트명(홈으로 가게 하는 사이트명)</a></li>
				<li><a href="#">로그인</a></li>
				<li><a href="<%=request.getContextPath() %>/member/join.jsp">회원가입</a></li>
				<li><a href="#">로그아웃</a></li>
				<li><a href="#">내정보</a></li>
				<li><a href="<%= request.getContextPath() %>/seller/seller_login.jsp">펜션관리</a></li>
				<li><a href="#">업소관리</a></li>
				<li><a href="#">입점신청</a></li>
				<li><a href="#">펜션 찾기</a></li>
				<li><a href="#">내 예약 보기</a></li>
			</ul>
		</nav>
		<section>
			<div class="row-empty"></div>
			<div class="row-empty"></div>
