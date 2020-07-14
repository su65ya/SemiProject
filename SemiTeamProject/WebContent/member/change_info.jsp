<%@page import="semi.beans.dao.MemberDao"%>
<%@page import="semi.beans.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style>
	.intext {
		width: 100%;
		padding-left: 0.5rem;
	}
	.form-input, .form-btn2{
            padding: 0.3rem;
            outline: none;/*선택시 자동 부여되는 테두리 제거*/
            border: 1px solid black;
        }
        .form-btn2{
        	background-color:lightgray;
            color: black;
            cursor: pointer;
        }  
</style>
    
 <%
    MemberDto mdto = (MemberDto) session.getAttribute("userinfo");
 	
 	String member_id = mdto.getMember_id();
 	MemberDao mdao = new MemberDao();
 	MemberDto user = mdao.get(member_id);
 %>
 
<jsp:include page="/template/nav.jsp"></jsp:include>

<article class="w-30">
	<div class="row">
		<h2>회원정보 수정</h2>
	</div>
	
	<form action="change_info.do" method="post">
	
	<div class="row">
		<table class="table table-sideopen">
			<tbody>
				<tr>
					<th>생년월일</th>
					<td class="left">
						<input class="intext" type="text" name="member_birth" value="<%=user.getMember_birthdayFormat()%>" required>
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td class="left">
						<input class="intext" type="text" name="member_mail" value="<%=user.getMember_mail()%>" required>
					</td>
				</tr>
				<tr>
					<th rowspan="3">주소</th>
					<td class="left">
						<input type="text" name="member_post" size="6" maxlength="6" value="<%=user.getMember_post()%>" placeholder="우편번호">
						<input class="form-btn2" style="width:50px;" type="button"  value="찾기">	
					</td>
				</tr>
				<tr>
					<td class="left">
						<input class="intext" type="text" name="member_basic_addr" value="<%=user.getMember_basic_addr()%>" placeholder="기본주소">
					</td>
				</tr>
				<tr>
					<td class="left">
						<input class="intext" type="text" name="member_detail_addr" value="<%=user.getMember_detail_addr()%>" placeholder="상세주소">
					</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td class="left">
						<input class="intext" type="text" name="member_phone" value="<%=user.getMember_phone() %>" required>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	
	<div class="row-empty"></div> 
		
	<div style="float: right;">
		<input class="form-btn" style="width: 120px;" type="submit" value="수정">
	</div>
	
	</form>
	
</article>


<jsp:include page="/template/footer.jsp"></jsp:include>