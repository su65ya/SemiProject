package semi.servlet.seller.room;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.dao.RoomDao;

@WebServlet(urlPatterns = "/seller/room_delete.do")
public class RoomDeleteServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int room_no = Integer.parseInt(req.getParameter("room_no"));
			
			
			RoomDao rdao = new RoomDao();
			rdao.delete(room_no);
			resp.sendRedirect("room_list.jsp");
			
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}

}
