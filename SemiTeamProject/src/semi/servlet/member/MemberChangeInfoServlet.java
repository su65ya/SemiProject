package semi.servlet.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.dao.MemberDao;
import semi.beans.dto.MemberDto;

@WebServlet(urlPatterns = "/member/change_info.do")
public class MemberChangeInfoServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try{
			//아이디는 세션에서
			MemberDto mdto = (MemberDto) req.getSession().getAttribute("userinfo");
			String member_id = mdto.getMember_id();
			
			MemberDto user = new MemberDto();
			user.setMember_id(member_id);
			// 생년월일, 이메일, 주소, 전화번호
			user.setMember_birth(req.getParameter("member_birth"));
			user.setMember_mail(req.getParameter("member_mail"));
			user.setMember_post(req.getParameter("member_post"));
			user.setMember_basic_addr(req.getParameter("member_basic_addr"));
			user.setMember_detail_addr(req.getParameter("member_detail_addr"));
			user.setMember_phone(req.getParameter("member_phone"));
			
			MemberDao mdao = new MemberDao();
			mdao.changeINfo(user);
			
			resp.sendRedirect("info.jsp");
		}
		
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
