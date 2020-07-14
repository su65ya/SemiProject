<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>날짜 선택기(Date Picker)</title>
  
    <style>
        
        .Search{
            text-align: center;
        }
		

   
    </style>  
  
    <!-- moment js : datepicker를 사용하기 위한 필수 의존성 파일 -->
    <script src="./js/moment.min.js"></script>
    <!-- date-range-picker -->
    <link rel="stylesheet" type="text/css" href="./css/lightpick.css">
    <script src="./js/lightpick.js"></script>
    
    <script>
        window.onload = function(){
            var options = {
                //선택1 날짜
                field: document.querySelector(".picker-start"),
                
                //선택택2 날짜
                secondField: document.querySelector(".picker-end"),
                
                //날짜 표시 형식 지정
                format: 'YYYY-MM-DD',
                
                //한 화면에 표시될 달의 개수
                numberOfMonths: 2,
                
                //시작일 지정
                //minDate:new Date(),//- 오늘부터 선택 가능
                minDate:moment(new Date())


<style>
.Search {
	text-align: center;
}
</style>

<!-- moment js : datepicker를 사용하기 위한 필수 의존성 파일 -->
<script src="../js/moment.min.js"></script>
<!-- date-range-picker -->
<link rel="stylesheet" type="text/css" href="../css/lightpick.css">
<script src="../js/lightpick.js"></script>

<script>
	window.onload = function() {
		var options = {
			//선택1 날짜
			field : document.querySelector(".picker-start"),

			//선택택2 날짜
			secondField : document.querySelector(".picker-end"),

			//날짜 표시 형식 지정
			format : 'YYYY-MM-DD',

			//한 화면에 표시될 달의 개수
			numberOfMonths : 2,

			//시작일 지정
			//minDate:new Date(),//- 오늘부터 선택 가능
			minDate : moment(new Date()),
			//선택 방향 제어
			selectForward : true,
			selectBackword : false,

			// 최소 / 최대  9박까지 설정되어짐
			minDays : 1,
			maxDays : 10,

			//선택 후 이벤트 설정(start와 end는 momentjs의 객체)
			onSelect : function(start, end) {
				if (!start || !end)
					return; //둘 중 하나라도 없으면 계산 중지
				var days = end.diff(start, 'days') + 1;
				console.log(days);
			}
		};
		var picker = new Lightpick(options);
	};
</script>
</head>

<body>
<form action="pension_list.jsp" method="post">
	<div class="Search center">

		<h2>실시간빈방검색</h2>
		<!-- 지역 선택용 입력창 -->
		<div class="PlaceList" style="border: 2px; float: left; width: 33%;">
			<img src="이미지" alt="지역"> <select onchange="PlaceList" name = "location">
				<option>전국</option>
				<option value="서울">서울</option>
				<option value="경기">경기도</option>
				<option value="강원">강원도</option>
				<option value="충청">충청도</option>
				<option value="경상">경상도</option>
				<option value="전라">전라도</option>
				<option value="제주">제주도</option>
			</select>
		</div>

		<!-- 날짜 선택용 입력창 -->
		<div class="data" style="border: 2px; float: left; width: 33%;">
			<img src="이미지" alt="날짜"> 
			<input type="text" class="picker-start" placeholder=""> 
			<input type="text"	class="picker-end">
		</div>

		<!-- 사람인원수 입력창 -->
		<div class="Person" style="border: 2px; float: left; width: 33%;">
			<img src="이미지"> <span class="selected-txt"
				id="memberCount">인원 </span> 
			<select onchange="person">
				<option>인원</option>
				<option value="1">1명</option>
				<option value="2">2명</option>
				<option value="3">3명</option>
				<option value="4">4명</option>
				<option value="5">5명</option>
				<option value="6">6명</option>
				<option value="7">7명</option>
				<option value="8">8명</option>
				<option value="9">9명</option>
				<option value="10">10명</option>
			</select>
			<input class="search" type="submit" value="검색">
		</div>
		<!-- 검색 버튼 -->
	</div>
	</form>