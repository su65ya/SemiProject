package semi.servlet.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

@WebServlet(urlPatterns = "/member/logout.do")
public class MemberLogoutServlet extends HttpServlet{
	
	@Override
	public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
		req.getSession().removeAttrubute("userinfo"); //삭제
		
		resp.sendRedirect(req.getContextPath());
	}

}
