

            
<jsp:include page="/template/nav.jsp"></jsp:include>
<html>	 	 
	 <div align="center">
	 	<h2>탈퇴 화면</h2>
	 	
	 	<script type="text/javascript">
        // 비밀번호 미입력시 경고창
        function checkValue(){
            if(!document.deleteform.password.value){
                alert("비밀번호를 입력하지 않았습니다.");
                return false;
            }
        }
    </script>
    
    <body>
 
    <br><br>
    <b><font size="4" color=#>비밀번호를 입력해 주세요</font></b>
    <br><br><br>
 
    <form name="deleteform" method="post" action="index.jsp?contentPage=seller/seller_delete.jsp"
        onsubmit="return checkValue()">
 
        <table>
            <tr>
                <td bgcolor=#FF99CC>비밀번호</td>
                <td><input type="password" name="password" maxlength="50"></td>
            </tr>
        </table>
        
        <br>
        <a href="<%= request.getContextPath() %>"> 
	        <input type="button" value="취소" >
        </a> 
        <input type="submit" value="탈퇴" /> 
    </form>
	</body>
	 
	 </div>
</html>
<jsp:include page="/template/footer.jsp"></jsp:include>   
    