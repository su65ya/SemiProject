package semi.servlet.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.dao.MemberDao;

@WebServlet(urlPatterns = "/admin/memberDrop.do")
public class AdminMemberDropServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			String member_id = req.getParameter("member_id");
			
			MemberDao mdao = new MemberDao();
			mdao.delete(member_id);
			
			resp.sendRedirect("admin_member_list.jsp");
		}
	
		catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
		
	}
}
