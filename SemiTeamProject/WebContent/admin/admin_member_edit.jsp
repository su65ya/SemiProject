<%@page import="semi.beans.dto.MemberDto"%>
<%@page import="semi.beans.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String member_id = request.getParameter("member_id");

	MemberDao mdao = new MemberDao();
	MemberDto mdto = mdao.get(member_id);
%>
<style>
	.intext {
		width: 100%;
		padding-left: 0.5rem;
	}
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

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function findAddress() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    //document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    //document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.querySelector("input[name=member_post]").value = data.zonecode;
                document.querySelector("input[name=member_basic_addr]").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.querySelector("input[name=member_detail.addr]").focus();
            }
        }).open();
    }
</script>
<jsp:include page="/template/nav.jsp"></jsp:include>

<article class="w-50">
	<div align="center">
	<h2>회원 [<%=mdto.getMember_name()%>(<%=mdto.getMember_id()%>)]님의 정보 수정</h2>
	</div>
</article>
<article class="w-30">
	<form action="admin_member_edit.do" method="post">
		<table class="table table-sideopen">
			<tbody>
				<tr>
					<th>아이디</th>
					<td class="left">
						<%=mdto.getMember_id() %>
						<input class="intext"  type="hidden" name="member_id" value="<%=mdto.getMember_id()%>">
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td class="left">
						<input  class="intext" type="text" name="member_pw" value="<%=mdto.getMember_pw()%>" required>
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td class="left">
						<input class="intext"  type="text" name="member_name" value="<%=mdto.getMember_name()%>">
					</td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td class="left">
						<input class="intext"  type="date" name="member_birth" value="<%=mdto.getMember_birthday()%>">
					</td>
				</tr>
				<tr>
					<th>메일</th>
					<td class="left">
						<input class="intext"  type="text" name="member_mail" value="<%=mdto.getMember_mail()%>">
					</td>
				</tr>
				<tr>
					<th rowspan="3">주소</th>
					<td class="left">
						<input type="text" name="member_post" value="<%=mdto.getMember_post()%>">
						<input class="form-btn2" style="width:100px;" onclick="findAddress();"  type="button"  value="우편번호 찾기">	
					</td>
				</tr>
				<tr>
					<td class="left">
						<input class="intext"  type="text" name="member_basic_addr" value="<%=mdto.getMember_basic_addr()%>">
					</td>
				</tr>
				<tr>
					<td  class="left">
						<input class="intext"  type="text" name="member_detail_addr" value="<%=mdto.getMember_detail_addr()%>">
					</td>
				</tr>
				<tr>
					<th>폰번호</th>
					<td  class="left">
						<input class="intext"  type="text" name="member_phone" value="<%=mdto.getMember_phone()%>">
					</td>
				</tr>
				<tr>
					<th>등급</th>
					<td  class="left">
						<select name="member_rate">
							<option>일반</option>
							<option>우수</option>
							<option>VIP</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>가입일</th>
					<td  class="left"><%=mdto.getMember_join() %></td>
				</tr>
			</tbody>
		</table>

	<div class="row-empty"></div> 
		
	<div style="float: right;">
		<input class="form-btn3" type="submit" value="수정">
	</div>
	
	</form>
</article>

<jsp:include page="/template/footer.jsp"></jsp:include>