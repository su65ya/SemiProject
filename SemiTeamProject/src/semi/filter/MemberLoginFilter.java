package semi.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.dto.MemberDto;

public class MemberLoginFilter implements Filter{
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
			
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		
		
		MemberDto mdto = (MemberDto) req.getSession().getAttribute("userinfo");
		
		boolean isLogin = mdto != null;
		
		if (isLogin) {	// 로그인
			chain.doFilter(request, response);
		}
		else {	// 로그아웃
			resp.sendRedirect(req.getContextPath()+"/member/login.jsp");
		}
	}
}
