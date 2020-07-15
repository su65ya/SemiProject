package semi.servlet.seller.room;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;

import semi.beans.dao.RoomImageDao;
import semi.beans.dto.RoomImageDto;

@WebServlet(urlPatterns = "/seller/roomdownload.do")
public class RoomImageDownloadServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int room_image_no = Integer.parseInt(req.getParameter("room_image_no"));
			
			RoomImageDao ridao = new RoomImageDao();
			RoomImageDto ridto = ridao.get(room_image_no);
			
			resp.setHeader("Content-Type", "application/octet-stream; charset=UTF-8");			
			resp.setHeader("Content-Disposition", "attachment; filename=\""+URLEncoder.encode(ridto.getRoom_image_name(), "UTF-8")+"\"");
			resp.setHeader("Content-Length", String.valueOf(ridto.getRoom_image_size()));	
			File target = new File("D://upload/room", String.valueOf(ridto.getRoom_image_no()));
			byte[] data = FileUtils.readFileToByteArray(target);
			resp.getOutputStream().write(data);
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}

}
