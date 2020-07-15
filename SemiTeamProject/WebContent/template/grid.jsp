<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <style>
        *{
           
            margin:1;
            padding:0;
            text-decoration: none /*이거 없으면 택스트 밑줄생김*/
        }
        
        li{list-style: none;}
        
        .image-con{
            top:30px;
            position:relative; 
            width:1000px; /*전체 디자인은 가로 960 */
            margin:auto;
            height:300;
        }
       
        .image-grid li:not(:last-child){
            float:left;
            margin-right : 30px; /*간격하고 간격사이 300+30+300+30+300=960*/
        }
        
        
        .controls {
            position : absolute;
            background: #333;
            color:#fff;
            padding: 10px 20px;
            margin :  0px;    
        }
        
        h1 {
            font-size: 20px;
            font-weight: 500;
            color: #1f2d3d;
            margin :  0.5px
            }

    strong {
          font-size: 30px;
          color: #F361DC;
          line-height: 1;
           }
        
 /* 위에가그리드css 아래가 배너css */
        
    .banner{
        background-color: #FF5E00;
        width:960px;
            
        }
    .banner2{
        background-color: #FF00DD;
        width:960px;
        }    
    .banner-title a{
         display : flex;
         text-decoration: none;
         justify-content: center;
         text-align: center;
         font-size:20px;
         color: #FFFFFF;
        }
        
    </style>

</head>
<body>
   
    <div class= "image-con">
       
        <ul class="image-grid">
        <!-- 첫번재줄-->
          <li class = "item">  
                  <a href= " " class="img">
                      <img src="http://placehold.it/300x300" alt ="300x300">
                      <h1>  자유여행+자유일정 </h1>
                      <strong> 2,000,000원~ </strong>
                  </a> 
                
          <li class = "item">  
                      <a href= " " class="img">
                      <img src="http://placehold.it/300x300" alt ="300x300">
                      <h1>  자유여행+자유일정 </h1>
                      <strong> 2,000,000원~ </strong>
                  </a> 
 
          <li class = "item">  
                  <a href= " " class="img">
                      <img src="http://placehold.it/300x300" alt ="300x300">
                      <h1>  자유여행+자유일정 </h1>
                      <strong> 2,000,000원~ </strong>
                  </a> 
              
          </li>
          <!-- 두번재줄-->
          <li class = "item">  
                  <a href= " " class="img">
                      <img src="http://placehold.it/300x300" alt ="300x300">
                      <h1>  자유여행+자유일정 </h1>
                      <strong> 2,000,000원~ </strong>
                  </a> 
              
          </li>
          <li class = "item">  
                  <a href= " " class="img">
                      <img src="http://placehold.it/300x300" alt ="300x300">
                      <h1>  자유여행+자유일정 </h1>
                      <strong> 2,000,000원~ </strong>
                  </a> 
              
          </li>
          <li class = "item">  
                  <a href= " " class="img">
                      <img src="http://placehold.it/300x300" alt ="300x300">
                      <h1>  자유여행+자유일정 </h1>
                      <strong> 2,000,000원~ </strong>
                  </a>     
        </ul>
        
        <!-- 위에가 그리드 아래가 배너 html-->
       
         <!-- 주황배너 --> 
           <div class="banner">
      <h1 class="banner-title">
        <a href="">
          🚗💨💨💨 모집 임박! 특가!!!
        </a>
      </h1>
    </div>
         <!-- 분홍배너 -->
     <div class="banner2">
      <h1 class="banner-title">
        <a href="">
          🚘💨🏁🚗 떠나요~!둘이서~!
        </a>
      </h1>
    </div>

        
    </div>
</body>
</html>