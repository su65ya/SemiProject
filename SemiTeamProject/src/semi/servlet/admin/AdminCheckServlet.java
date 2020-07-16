package semi.servlet.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.dao.AdminDao;
import semi.beans.dto.AdminDto;

@WebServlet(urlPatterns = "/admin/admin_check.do")
public class AdminCheckServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			String go = req.getParameter("go");
			
			String admin_pw = req.getParameter("admin_pw");
			
			AdminDto adto = (AdminDto) req.getSession().getAttribute("admininfo");
			String admin_id = adto.getAdmin_id();
			
			AdminDao adao = new AdminDao();
			AdminDto user = new AdminDto();
			user.setAdmin_id(admin_id);
			user.setAdmin_pw(admin_pw);
			AdminDto result = adao.login(user);
			
			if(result == null) {
				resp.sendRedirect("admin_check.jsp?error&go=" +go);
			}
			else {
				resp.sendRedirect(go);
			}
		}
		
		catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
