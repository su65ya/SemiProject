<%@page import = "semi.beans.dto.SellerDto" %>
<%@page import = "semi.beans.dao.SellerDao" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    SellerDto mdto = (SellerDto)session.getAttribute("userinfo");
    
    String seller_id = mdto.getSeller_id();
	SellerDao mdao = new SellerDao(); 
	SellerDto user = mdao.get(seller_id);
    
    
    %>
    
    
    
    <jsp:include page="/template/nav.jsp"></jsp:include>
    <div align="center">
    	<h2>판매자 정보 수정</h2>
    	
    	<form action = "change_info.do"method="post">
    		<table>
    			<tbody>
    				<tr>
    					<th>이름 </th>
    					<td>
    					<input type = "text"name="seller_name"requirde>
    					</td>
    				</tr>
    				<tr>
    					<th>이메일</th>
    					<td>
    					<input type = "text" size="50" name="seller_mail" maxlength="50" value="">
    					 <select name="mail2" id="mail2">
                            <option value="naver.com">naver.com</option>
                            <option value="gmail.com">gmail.com</option>
                            <option value="daum.net" >daum.net</option>
                            <option value="nate.com">nate.com</option>                        
                        </select>
    					</td>
    				</tr>
    				<tr>
    					<th>휴대전화</th>
    					<td><select name="phone1" id="phone1" value="<%=mdto.getSeller_phone() %>">
                            <option value="010">010</option>
                            <option value="016">016</option>
                            <option value="011" >011</option>
                            <option value="019">019</option>
                            <option value="017">017</option>                        
                        </select>
                        -
                        <input type = "text"size = "5" name="seller_phone" maxlength="4" vallue="<%=mdto.getSeller_phone() %>">
                        -
                        <input type = "text"size = "5" name="seller_phone" maxlength="4" vallue="<%=mdto.getSeller_phone() %>">
                        </td>
    					
    					
    				</tr>
    				<tr>
    					<th>주소</th>
    					<td>
    					<input type = "text" size="30" name="seller_address" vallue"<%=mdto.getSeller_basic_addr() %>">
    					</td>
    				
    				</tr>
    				<tr>
    					<th></th>
    					<td>
    					<input type = "text" size="50" placeholder="상세주소 입력" name="seller_address2" vallue"<%=mdto.getSeller_detail_addr() %>">
    					</td>
    				</tr>
    				<tr>
    					<th>사업자번호</th>
    					<td>
    					<input type = "text" size = "30" name="company_no" maxlength="10" requirde vallue="<%=mdto.getCompany_no() %>">
    			
    			</tbody>
    			<tfoot>
    				<tr>
    					<td colspan = "2" align = "center">
    						<input type = "submit" value = "수정하기">
    					</td>
    				</tr>
    			</tfoot>
    		</table>
       	</form>
    </div>
    

    
    
    
    
    
    <jsp:include page="/template/footer.jsp"></jsp:include>