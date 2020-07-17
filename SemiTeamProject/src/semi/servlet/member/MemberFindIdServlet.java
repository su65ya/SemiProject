package semi.servlet.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.dao.MemberDao;
import semi.beans.dto.MemberDto;

@WebServlet(urlPatterns = "/member/find_id.do")
public class MemberFindIdServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try{
			
			
			MemberDto mdto = new MemberDto();
			mdto.setMember_name(req.getParameter("member_name"));
			mdto.setMember_phone(req.getParameter("member_phone"));
			mdto.setMember_birth(req.getParameter("member_birth"));
			
			
			MemberDao mdao = new MemberDao();
			String member_id = mdao.findId(mdto);
			
			if(member_id != null) {
				req.getSession().setAttribute("member_id", member_id);
				resp.sendRedirect("member_find_id_result.jsp");
			}
			else {
				resp.sendRedirect("member_find_id.jsp?error");
			}
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}

}
