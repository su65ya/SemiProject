package semi.servlet.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.dao.MemberDao;
import semi.beans.dto.MemberDto;

@WebServlet(urlPatterns = "/member/change_password.do")
public class MemberChangePasswordServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			MemberDto mdto = (MemberDto) req.getSession().getAttribute("userinfo");
			String member_id = mdto.getMember_id();
			
			String member_pw = req.getParameter("member_pw");
			
			MemberDto user = new MemberDto();
			user.setMember_id(member_id);
			user.setMember_pw(member_pw);
			
			MemberDao mdao = new MemberDao();
			mdao.changePassword(user);
			
			resp.sendRedirect("change_password_result.jsp");

		}
		
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
		
	}
}
