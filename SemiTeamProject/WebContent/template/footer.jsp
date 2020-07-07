<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


		
			<div class="row-empty"></div>
			<div class="row-empty"></div>
		</section>


		<footer>
			<div class="row">
				<ul class="footer">
					<li><a href="#">업소관리</a></li>
					<li><a href="#">펜션관리</a></li>
					<li><a href="#">입점신청</a></li>
				</ul>
				<h6>sellerinfo : <%=session.getAttribute("sellerinfo") %></h6>
				<h6>로그인 : <%=session.getAttribute("sellerinfo") != null %></h6>
				<address class="footer">
					<span>고객행복센터 1004-1004 오전 9:30 - 오후 6:30, 점심시간: 오후 12:30 - 오후 1:30<br>
						(주) 우리조짱캠퍼니<br>
						주소 : 서울영등포구 선유동 2로 67 이레빌딩 19,20층<br>
						공동사업자 : 이원희 | 이주용 | 정연재 | 양수아 | 배동근  | 최영완 <br>
						전화번호 : 1004-1004<br>
					</span>
				</address>
			</div>
		</footer>
	</main>
	
</body>
</html>