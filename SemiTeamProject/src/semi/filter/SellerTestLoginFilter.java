package semi.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.dao.SellerDao;
import semi.beans.dto.SellerDto;

//등록은 web.xml에 수행
public class SellerTestLoginFilter implements Filter {
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
//	다운캐스팅
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;

		try {
//			목표 : 서버를 구동하기만 하면 로그인이 되어있도록 구현하는 것
//			- 관리자로 가입시키든, 사용자로 가입시키든 선택하여 구현
//			- 주의 : 개발용이므로 서비스 배포시 반드시 제거
//					
//			계획 : 
//			1.현재 요청을 보낸 사용자의 로그인 여부를 조사
//			2. 1번에서 로그인이 되어있다면 통과, 안되어있다면 로그인 처리를 수행
//				-DB에 아이디를 미리 만들어 두었다면 그 아이디를 불러와서 처리
//				-DB에 아이디를 미리 만들어 두지 않았다면 신규 가입 처리 후 수행
//			3.2번에서 불러온 정보를 세션에 저장 후 통과

			
			
//			1번 코드
			SellerDto sdto = (SellerDto) req.getSession().getAttribute("sellerinfo");

//			2번 코드
			if (sdto == null) {
				// 3번 코드
				SellerDao sdao = new SellerDao();
				SellerDto seller = sdao.get("khseller"); // khacademy 아이디 확인
				if (seller == null) {// 찾는 아이디가 없으면
					// 회원가입 및 재검색
					SellerDto newSeller = new SellerDto();
					newSeller.setSeller_id("khseller");
					newSeller.setSeller_pw("khseller");
					newSeller.setSeller_name("판매자");
					newSeller.setSeller_birth("2020-01-01");
					newSeller.setSeller_phone("01011112222");
					newSeller.setSeller_email("seller@naver.com");
					newSeller.setCompany_no("1112233333");
					sdao.join(newSeller);//등록시키기
					
					seller = sdao.get("khseller");//user에 방금 가입한 khacademy를 등록
				}
				// 로그인
				req.getSession().setAttribute("sellerinfo", seller);
			}

			chain.doFilter(request, response);// 통과

		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
