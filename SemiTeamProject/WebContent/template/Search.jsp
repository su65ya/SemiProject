<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

    <style>
        * {
            box-sizing: border-box;
        }

        .search-form{
            text-align: center;
            margin-bottom: 50px;
        }
        .search-form .search {
            display: inline-block;
        }
        .search-form .search::after{
            content: "";
            display: block;
            clear: both; /*플로트 float 쓰기전에 이거 있어야함*/
        } 
        .search-form .search-list {
            position: static;
            display: flex;
            float: left;
        }

         .serch-h1{
            text-align:center;
            margin: 1px; 
            font-weight : bold;
            padding :1px;
           
            
        }
        .search-form .search-date {
            display: flex;
            float: left;

        }

        .search-form .search-person {
            display: flex;
            float: left;

        }

        .search-form .search-submit {
            font-size: 15px;
            width: 70px;
            font-weight : bold;
            background-color: #795548;
            color: white;
            border: none;
            outline: none;
            
        }
        .search-submit:hover{
        	background-color: #b2bec3;
        }

        .search-form .search-img {
            height: auto;
            margin-left:10px;
            margin-right:10px;
            max-width: 40px;
            max-height: 40px;
            float: left;
        }

    </style>

    <!-- moment js : datepicker를 사용하기 위한 필수 의존성 파일 -->
    <script src="<%=request.getContextPath() %>/js/moment.min.js"></script>
    <!-- date-range-picker -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/lightpick.css">
    <script src="<%=request.getContextPath() %>/js/lightpick.js"></script>

    <script>
    window.addEventListener("load", function(){	
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
                minDate: moment(new Date()),

                //선택 방향 제어
                selectForward: true,
                selectBackword: false,

                // 최소 / 최대  9박까지 설정되어짐
                minDays: 1,
                maxDays: 10,


                //선택 후 이벤트 설정(start와 end는 momentjs의 객체)
                onSelect: function(start, end) {
                    if (!start || !end) return; //둘 중 하나라도 없으면 계산 중지
                    var days = end.diff(start, 'days') + 1;
                    console.log(days);
                }
            };
            var picker = new Lightpick(options);
        });

    </script>


    <form class="search-form" action="<%=request.getContextPath() %>/member/pension_list.jsp" method="get">
        <div class="search">
           <h1 class="serch-h1">실시간빈방검색</h1>
           <div class="row-empty"></div>
           <div class="row-emptyy"></div>
            <!-- 지역 선택용 입력창 -->
            <div class="search-list">
                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSSllcrcrPmFT9dWzsp2ARc3qUfbwIavLyezQ&usqp=CAU" alt="지역" class="search-img" >
                <select name="location">
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
            <div class="search-date">
                <img src="https://i.pinimg.com/474x/6d/c9/e4/6dc9e44096a62281c71f27a23e1c42cb.jpg" alt="날짜" class="search-img">
                <input name="start_date" type="text" class="picker-start" placeholder="">&nbsp;
                <input name="finish_date" type="text" class="picker-end">
            </div>

            <!-- 사람인원수 입력창 -->
            <div class="search-person">
                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcS46t4HaVXE28g2KosQb0rGQIshseGS_fV_sA&usqp=CAU" alt="날짜" class="search-img">
                <select name="person">
                    <option value="0">인원</option>
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
                </select>&nbsp;
               <input class = "search-submit" type="submit" value="검색">
            </div>
               
           

            <!-- 검색 버튼 -->



        </div>
    </form>
