package semi.servlet.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.dao.MemberDao;
import semi.beans.dto.MemberDto;

@WebServlet(urlPatterns = "/member/check.do")
public class MemberCheckServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			String go = req.getParameter("go");
			
			String member_pw = req.getParameter("member_pw");
			
			MemberDto mdto = (MemberDto) req.getSession().getAttribute("userinfo");
			String member_id = mdto.getMember_id();
			
			MemberDao mdao = new MemberDao();
			MemberDto user = new MemberDto();
			user.setMember_id(member_id);
			user.setMember_pw(member_pw);
			MemberDto result = mdao.login(user);
			
			if(result == null) {
				resp.sendRedirect("check.jsp?errer&go=" +go);
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
