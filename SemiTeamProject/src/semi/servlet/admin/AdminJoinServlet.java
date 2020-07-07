package semi.servlet.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.dao.AdminDao;
import semi.beans.dto.AdminDto;

@WebServlet(urlPatterns = "/admin/admin_join.do")
public class AdminJoinServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			AdminDto adto = new AdminDto();
			adto.setAdmin_id(req.getParameter("admin_id"));
			adto.setAdmin_pw(req.getParameter("admin_pw"));
			adto.setAdmin_phone(req.getParameter("admin_phone"));
			adto.setAdmin_mail(req.getParameter("admin_mail"));
			adto.setAdmin_birth(req.getParameter("admin_birth"));
		
			AdminDao adao = new AdminDao();
			adao.join(adto);
		
			resp.sendRedirect("admin_join_res.jsp");
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
