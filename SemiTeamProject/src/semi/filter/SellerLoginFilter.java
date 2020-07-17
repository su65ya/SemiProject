package semi.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.dto.SellerDto;

//@WebFilter(urlPatterns = "/seller/*")
public class SellerLoginFilter implements Filter {
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;

		SellerDto sdto = (SellerDto) req.getSession().getAttribute("sellerinfo");
		
		boolean isSellerLogin = sdto != null;
		
		if(isSellerLogin) {
			chain.doFilter(request, response);
		}else {
			resp.sendRedirect(req.getContextPath()+"/seller/seller_login.jsp");
		}
	}
}
