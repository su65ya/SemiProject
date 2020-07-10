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
                minDate:moment(new Date()),

                //선택 방향 제어
                selectForward: true,
                selectBackword: false,
                
                // 최소 / 최대  9박까지 설정되어짐
                minDays : 1, 
                maxDays : 10,
                
                
                //선택 후 이벤트 설정(start와 end는 momentjs의 객체)
                onSelect:function(start, end){
                    if(!start || !end) return; //둘 중 하나라도 없으면 계산 중지
                    var days = end.diff(start, 'days') + 1;
                    console.log(days);
                }
            };
            var picker = new Lightpick(options);
        };
    </script>
</head>

<body>
 
  <div class = "Search">   
  
  <h2>실시간빈방검색</h2>
   <!-- 지역 선택용 입력창 -->
  <div class="PlaceList"style="border: 2px; float: left; width: 33%;"> 
  <img src="이미지" alt="지역">
  <select onchange="PlaceList">
  <option>전국</option>
  <option value="a">가평</option>
  <option value="b">양평</option>
  <option value="c">인천강화도</option>
  <option value="d">춘천/강촌/홍천/</option>
  <option value="e">평창/횡성</option>
  <option value="f">포천</option>
  <option value="g">남양주</option>
  <option value="h">안면도/태안</option>
  <option value="i">서산/보령</option>
  <option value="j">충주/제천/단양</option>
  <option value="k">설악산/속초/양양/강릉/고성</option>
  <option value="l">삼척/동해</option>
  <option value="m">울진/경주/영덕/포항</option>
  <option value="n">용인/안성</option>
  <option value="o">대부도/영흥도/영종도</option>
  <option value="p">변산</option>
  <option value="q">남해/거제</option>
  <option value="r">여수/순천</option>
  <option value="s">경기도</option>
  <option value="t">강원도</option>
  <option value="u">충청도</option>
  <option value="v">경상도</option>
  <option value="w">전라도</option>     
  <option value="x">제주도</option>
  <option value="y">서울</option>     
  </select>
    </div> 
    
    <!-- 날짜 선택용 입력창 -->
    <div class="data" style="border: 2px; float: left; width: 33%;"> 
    <img src="이미지" alt="날짜">
    <input type="text" class="picker-start">
    <input type="text" class="picker-end">
    </div>

  <!-- 사람인원수 입력창 -->
  <div class="Person" style="border:2px; float: left; width: 33%;">  
  <img src="이미지" alt="인원"></i>    
  <select onchange="person">
  <option>인원</option>
  <span class="selected-txt" id="memberCount">인원 </span>
  <option value="a">1명</option>
  <option value="b">2명</option>
  <option value="c">3명</option>
  <option value="d">4명</option>
  <option value="e">5명</option>
  <option value="f">6명</option>
  <option value="g">7명</option>
  <option value="h">8명</option>
  <option value="i">9명</option>
  <option value="j">10명</option>
  
  <!-- 검색 버튼 -->
  <div calss="row" style="border: 2px; float: left; width: 33%;">
  <input class="search" type="submit" value="검색">
  </div>
  
</body>
</html>