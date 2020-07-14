<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>grid</title>
    <style>
        *{
        margin:1; 
        padding:0;
        }
        
        li{list-style: none;}
        
        .image-con{
            position:relative;
            top:30px;
            width:960px;
            margin:auto;
            height:300;
        }
       
        .image-grid li:not(:last-child){
            float:left;
            margin-right : 30px;
        }
        
        
        .controls {
            position : absolute;
            background: #333;
            color:#fff;
            padding: 10px 20px;
            margin :  0px;    
        }
        
        h1 {
            font-size: 15px;
            font-weight: 500;
            color: #1f2d3d;
            }

    strong {
          font-size: 22px;
          color: #F361DC;
          line-height: 1;
          }
        
    </style>

</head>
<body>
   
    <div class= "image-con">
       
        <ul class="image-grid">
          <li class = "item">  
          <div class="listItem">
              <div class="listImage">
                  <a href= " " class="img">
                      <img src="http://placehold.it/300x300" alt ="300x300">
                      <h1>  자유여행+자유일정 </h1>
                      <strong> 2,000,000원~ </strong>
                  </a> 
              </div>  
          </div>
          </li>
          
          <li class = "item">  
          <div class="listItem">
              <div class="listImage">
                  <a href= " " class="img">
                      <img src="http://placehold.it/300x300" alt ="300x300">
                      <h1>  자유여행+자유일정 </h1>
                      <strong> 2,000,000원~ </strong>
                  </a> 
              </div>  
          </div>
          </li>
          
          <li class = "item">  
          <div class="listItem">
              <div class="listImage">
                  <a href= " " class="img">
                      <img src="http://placehold.it/300x300" alt ="300x300">
                      <h1>  자유여행+자유일정 </h1>
                      <strong> 2,000,000원~ </strong>
                  </a> 
              </div>  
          </div>
          </li>
        </ul>
        
    </div>
</body>
</html>