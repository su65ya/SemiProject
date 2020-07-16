<%@page import="semi.beans.dao.MemberDao"%>
<%@page import="semi.beans.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
    MemberDto mdto = (MemberDto) session.getAttribute("userinfo");
 
 	int member_no = mdto.getMember_no();
	MemberDao mdao = new MemberDao();
	MemberDto user = mdao.getNo(member_no);
 %>
 
<jsp:include page="/template/nav.jsp"></jsp:include>

<style>
	    .form-input,.form-btn2,.form-btn3{
            width: 100%;
            padding: 0.5rem;
            outline: none;/*선택시 자동 부여되는 테두리 제거*/
            border: none;
    		border-radius: 5px;
        }
        .form-input:focus{
            border-color: #b2bec3;
        }
        .form-btn2{
        	background-color:#636e72;
        	width : 150px;
            color: white;
            cursor: pointer;
        }
        .form-btn3{
        	background-color:#ff7675;
        	width : 150px;
            color: white;
            cursor: pointer;
        }
        .form-btn2:hover,.form-btn3:hover {
        	background-color:#b2bec3;
        }
        .font_color_a {
        	color : #636e72;
        	font-style: normal;
        	font-size: 14px;
        }
</style>
    
<article class="w-40">
	<div class="row">
		<h2>회원정보</h2>
	</div>
	
	<div class="row">
		<table class="table table-sideopen table-hover">
			<tbody>
				<tr>
					<th>아이디</th>
					<td class="left eft font_color_a"><%=user.getMember_id()%></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td class="left eft font_color_a">
						<a href="change_password.jsp">
						<input class="form-btn2" style="width:110px;" type="button"  value="비밀번호 변경">
						</a>
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td class="left font_color_a"><%=user.getMember_name() %></td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td class="left font_color_a"><%=user.getMember_birthdayFormat() %></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td class="left font_color_a"><%=user.getMember_mail() %></td>
				</tr>
				<tr>
					<th rowspan="4">주소</th>
				</tr>
				<tr>
					<td class="left font_color_a">[<%=user.getMember_post() %>]</td>
				</tr>
				<tr>
					<td class="left font_color_a"><%=user.getMember_basic_addr()%></td>
				</tr>
				<tr>
					<td class="left font_color_a"><%=user.getMember_detail_addr()%></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td  class="left font_color_a"><%=user.getMember_phone() %></td>
				</tr>
				<tr>
					<th>등급</th>
					<td class="left font_color_a"><%=user.getMember_rate() %></td>
				</tr>
				<tr>
					<th>가입일</th>
					<td class="left font_color_a"><%=user.getJoin_day() %></td>
				</tr>
			</tbody>		
		</table>

	</div>
	
	<div class="row right">
		<a href="check.jsp?go=delete.do">
			<input class= "form-btn3" type="button" value="회원 탈퇴">
		</a>
		<a href="check.jsp?go=change_info.jsp">
			<input class= "form-btn2" type="button" value="회원정보 수정">
		</a>
	</div>
	
	<div class="row-empty"></div>
	<div class="row-empty"></div> 
	<div class="row-empty"></div>  
	

</article>


<jsp:include page="/template/footer.jsp"></jsp:include>