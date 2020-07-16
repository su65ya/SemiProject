package semi.servlet.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.dao.MemberDao;
import semi.beans.dto.MemberDto;

@WebServlet(urlPatterns = "/admin/admin_member_edit.do")
public class AdminMemberEditServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			MemberDto mdto = new MemberDto();
			mdto.setMember_id(req.getParameter("member_id"));
			mdto.setMember_pw(req.getParameter("member_pw"));
			mdto.setMember_name(req.getParameter("member_name"));
			mdto.setMember_birth(req.getParameter("member_birth"));
			mdto.setMember_mail(req.getParameter("member_mail"));
			mdto.setMember_post(req.getParameter("member_post"));
			mdto.setMember_basic_addr(req.getParameter("member_basic_addr"));
			mdto.setMember_detail_addr(req.getParameter("member_detail_addr"));
			mdto.setMember_phone(req.getParameter("member_phone"));
			mdto.setMember_rate(req.getParameter("member_rate"));
			
			MemberDao mdao = new MemberDao();
			mdao.editByAdmin(mdto);
			
			resp.sendRedirect("admin_member_detail.jsp?member_id=" + mdto.getMember_id());
		}
		
		catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
		
		
	}
}
