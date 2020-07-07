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
		
		
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;

		try {
			SellerDto sdto = (SellerDto) req.getSession().getAttribute("sellerinfo");

			if (sdto == null) {
				SellerDao sdao = new SellerDao();
				SellerDto seller = sdao.get("khseller"); // khseller 아이디 확인
				if (seller == null) {// 찾는 아이디가 없으면
					// 회원가입 및 재검색
					SellerDto newSeller = new SellerDto();
					newSeller.setSeller_id("khseller");
					newSeller.setSeller_pw("khseller");
					newSeller.setSeller_name("판매자");
					newSeller.setSeller_birth("2020-01-01");
					newSeller.setSeller_phone("01011112222");
					newSeller.setSeller_mail("seller@naver.com");
					newSeller.setCompany_no("1112233333");
					sdao.join(newSeller);//등록시키기
					
					seller = sdao.get("khseller");
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
