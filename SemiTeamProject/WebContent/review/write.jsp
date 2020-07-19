<%@page import="semi.beans.dao.ReviewDao"%>
<%@page import="semi.beans.dto.ReviewInfoGetDto"%>
<%@page import="semi.beans.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	
	int review_pension_no=Integer.parseInt(request.getParameter("review_pension_no"));
	MemberDto mdto = (MemberDto)session.getAttribute("userinfo");
	ReviewDao rdao = new ReviewDao();
	ReviewInfoGetDto getDto = rdao.getInfo(mdto.getMember_no(), review_pension_no);
	int res_no = getDto.getRes_no();

%>

<script>
function preview(){
            var fileTag = document.querySelector("input[name=review_file]");
            
            var divTag = document.querySelector(".preview-wrap");
            
            if(fileTag.files.length > 0){
                //선택된 파일들을 다 읽어와서 이미지 생성 후 추가
                //미리보기 전부 삭제
                divTag.innerHTML = "";
                
                for(var i=0; i < fileTag.files.length; i++){
                    var reader = new FileReader();
                    reader.onload = function(data){
                        //img 생성 후 data.target.result 설정하여 추가
                        var imgTag = document.createElement("img");
                        imgTag.setAttribute("src", data.target.result);
                        imgTag.setAttribute("width", "150");
                        imgTag.setAttribute("height", "120");
                        divTag.appendChild(imgTag);
                    };
                    reader.readAsDataURL(fileTag.files[i]);
                }
                
            }
            else{
                //미리보기 전부 삭제
                divTag.innerHTML = "";
            }
        }
        
    </script>
	<style>
    	span{
    		color:red;
    		font-size:16;
    	}
    	label{
    		font-size:13;
    	}
    </style>

<jsp:include page="/template/nav.jsp"></jsp:include>


<form action="review_write.do" method="post" enctype="multipart/form-data">
	<input type="hidden" name="review_pension_no" value ="<%=request.getParameter("review_pension_no")%>">
	<input type="hidden" name="res_no" value ="<%=res_no%>">
	<article class="w-40">
		<div class="row-empty"></div>

		<div class="row">
			<h2>리뷰 작성</h2>
		</div>
		
		<div class="row">
			<label><span>*</span>리뷰 제목</label>
			<input class="form-input" type="text" name="review_title">
		</div>
		
		<div class="row">
			<label><span>*</span>리뷰 내용</label><br>
			<textarea name="review_content" rows="10px" cols="80px"></textarea>
		</div>
		<div class="row-empty"></div>
		<hr>
		<!-- 첨부 파일 -->
		<div class="row">
			<h4>첨부 파일 올리기</h4><br>
			<input type="file" name="review_file" multiple accept=".jpg, .png, .gif" onchange="preview();">
			<div class="row-empty"></div>
			<div class="preview-wrap"></div>
		</div> 
		<div class="row-empty"></div>
        <div class="row-empty"></div>		
		<div class="row">
			<input class="form-btn" type="submit" value="등록">
		</div>		


	</article>
</form>





<jsp:include page="/template/footer.jsp"></jsp:include>