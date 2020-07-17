package semi.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.dao.AdminDao;
import semi.beans.dto.AdminDto;

public class AdminTestLoginFilter implements Filter{
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse resp = (HttpServletResponse)response;
		try {
			
		
		AdminDto adto = (AdminDto)req.getSession().getAttribute("admininfo");
		
		if(adto == null) {
			AdminDao adao = new AdminDao();
			AdminDto admin = adao.get("khadmin");
			if(admin == null) {
				AdminDto newAdmin = new AdminDto();
				newAdmin.setAdmin_id("khadmin");
				newAdmin.setAdmin_pw("khadmin");
				newAdmin.setAdmin_phone("01012345678");
				newAdmin.setAdmin_mail("admin@naver.com");
				newAdmin.setAdmin_birth("20200720");
				
				adao.join(newAdmin);
				
				admin = adao.get("admin");
				
			}
				req.getSession().setAttribute("admininfo", admin);
			}
			chain.doFilter(request, response);//통과
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
