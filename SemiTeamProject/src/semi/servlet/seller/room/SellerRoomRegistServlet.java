package semi.servlet.seller.room;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.dao.RoomDao;
import semi.beans.dto.PensionDto;
import semi.beans.dto.RoomDto;

@WebServlet(urlPatterns = "/seller/room_regist.do")
public class SellerRoomRegistServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//입력
			
			RoomDto rdto = new RoomDto();
			rdto.setRoom_pension_no(Integer.parseInt(req.getParameter("pension_no")));
			rdto.setRoom_name(req.getParameter("room_name"));
			rdto.setRoom_type(req.getParameter("room_type"));
			rdto.setStandard_people(Integer.parseInt(req.getParameter("standard_people")));
			rdto.setMax_people(Integer.parseInt(req.getParameter("max_people")));
			rdto.setRoom_width(Integer.parseInt(req.getParameter("room_width")));
			rdto.setToilet_count(Integer.parseInt(req.getParameter("toilet_count")));
			rdto.setOff_weekday(Integer.parseInt(req.getParameter("off_weekday")));
			rdto.setOff_weekend(Integer.parseInt(req.getParameter("off_weekend")));
			rdto.setOn_weekday(Integer.parseInt(req.getParameter("on_weekday")));
			rdto.setOn_weekend(Integer.parseInt(req.getParameter("on_weekend")));
			
			int amenity = Integer.parseInt(req.getParameter("amenity"));
			rdto.setAmenity(amenity);
			int microwave = Integer.parseInt(req.getParameter("microwave"));
			rdto.setMicrowave(microwave);
			int bed = Integer.parseInt(req.getParameter("bed"));
			rdto.setBed(bed);
			int tv = Integer.parseInt(req.getParameter("tv"));
			rdto.setTv(tv);
			int room_sofa = Integer.parseInt(req.getParameter("room_sofa"));
			rdto.setRoom_sofa(room_sofa);
			int room_aircon = Integer.parseInt(req.getParameter("room_aircon"));
			rdto.setRoom_aircon(room_aircon);
			int fridge = Integer.parseInt(req.getParameter("fridge"));
			rdto.setFridge(fridge);
			int tub = Integer.parseInt(req.getParameter("tub"));
			rdto.setTub(tub);
			int hairdryer = Integer.parseInt(req.getParameter("hairdryer"));
			rdto.setHairdryer(hairdryer);
			int cookoo = Integer.parseInt(req.getParameter("cookoo"));
			rdto.setCookoo(cookoo);
			int dog = Integer.parseInt(req.getParameter("dog"));
			rdto.setDog(dog);
			
			
			RoomDao rdao = new RoomDao();
			rdao.regist(rdto);
			
			resp.sendRedirect("room_result.jsp");
		}catch(Exception e){
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
