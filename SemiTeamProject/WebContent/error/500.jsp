<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<jsp:include page="/template/nav.jsp"></jsp:include>

<div align="center">
	<h2>일시적인 오류가 발생했습니다</h2>
	<img src="<%= request.getContextPath() %>/image/500.jpg">

</div>


<jsp:include page="/template/footer.jsp"></jsp:include>