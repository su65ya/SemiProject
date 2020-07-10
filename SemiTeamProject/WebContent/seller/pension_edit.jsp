<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/nav.jsp"></jsp:include>
<%@page import="semi.beans.dao.PensionDao"%>
<%@page import="semi.beans.dto.PensionDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    int pension_no = Integer.parseInt(request.getParameter("pension_no"));
	PensionDao pdao = new PensionDao();
	PensionDto pdto = pdao.get(pension_no);
    
    %>
<jsp:include page="/template/nav.jsp"></jsp:include>

	<article class="w-40">
		<form action="pension_regist.do" method="post">
		<!-- 수정이 가능하도록 PK를 숨김 첨부한다 -->
		<input type="hidden" name="board_no" value="<%=pension_no()%>">
			<div class="row-empty"></div>
			<div class="row">
				<h2>펜션 등록</h2>
			</div>
			<div class="row-empty"></div>
			<div class="row">
				<label><span>*</span>펜션 이름</label>
				<input class="form-input" type="text" name="pension_name" placeholder="16자 이내" required>
			</div>
			
			<div class="row">
				<label><span>*</span>주소 입력</label><br>
				<input class="form-input form-inline" type="text" name="pension_post" placeholder="우편번호" required>
				<input onclick="findAddress();" type="button" value="우편번호 찾기">
			</div>
			<div class="row">
				<input class="form-input" type="text" name="pension_basic_addr" placeholder="기본주소" required>
			</div>
			<div class="row">
				<input class="form-input" type="text" name="pension_detail_addr" placeholder="상세주소" required>
			</div>
			<div class="row">
				<label><span>*</span>펜션 전화번호</label>
				<input class="form-input" type="text" name="pension_phone" placeholder="펜션 전화번호" required>
			</div>
			<div class="row">
				<label><span>*</span>펜션 소개글</label>
				<textarea rows="15" cols="77" name="pension_intro" required></textarea>
			</div>
			<div class="row-empty"></div>
			<div class="row">
				<label>펜션 사진 등록</label><br>
				<div class="row-empty"></div>
				<input type="file" name="pension_image" multiple accept=".jpg,.png,.gif">
			</div>
			<div class="row-empty"></div>
			<div class="row">
				<input class= "form-btn" type="submit" value="등록하기">
			</div>
			<div class="row"></div>
		
		</form>
	</article>

<jsp:include page="/template/footer.jsp"></jsp:include>
