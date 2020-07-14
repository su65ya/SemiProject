package semi.servlet.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.dto.MemberDto;
import semi.beans.dao.MemberDao;
 
@WebServlet(urlPatterns = "/member/member_delete.do")
public class MemberDeleteServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {// 입력
			MemberDto mdto = (MemberDto) req.getSession().getAttribute("userinfo");
			String member_id = mdto.getMember_id();

			// 처리
			MemberDao mdao = new MemberDao();
			mdao.delete(member_id);

			req.getSession().removeAttribute("userinfo");

			resp.sendRedirect("delete_result.jsp");

		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}

}
