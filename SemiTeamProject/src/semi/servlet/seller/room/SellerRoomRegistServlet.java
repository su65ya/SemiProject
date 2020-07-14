package semi.servlet.seller.room;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import semi.beans.dao.RoomDao;
import semi.beans.dao.RoomImageDao;
import semi.beans.dto.PensionDto;
import semi.beans.dto.RoomDto;
import semi.beans.dto.RoomImageDto;
import semi.beans.dto.SellerDto;

@WebServlet(urlPatterns = "/seller/room_regist.do")
public class SellerRoomRegistServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String charset="UTF-8";//해석할 인코딩 방식
			int  limit = 10 * 10 * 1024;//파일의 최대 허용 용량 //10MB
			File baseDir = new File("D:/upload/room");//파일이 저장될 폴더 객체
			baseDir.mkdir();//없으면 만들어라
			
			//생성을 도와주는 도구 생성(factory)
			DiskFileItemFactory factory = new DiskFileItemFactory();
			factory.setDefaultCharset(charset);
			factory.setSizeThreshold(limit);
			factory.setRepository(baseDir);
			
			//factory의 정보를 기반으로 도구를 생성하는것=>utility
			ServletFileUpload utility = new ServletFileUpload(factory);
			//-FileItem은 분석된 요청 데이터 1개를 의미
			//utility를 이용하여 multipart/form-data 요청을 해석
			Map<String,List<FileItem>>map = utility.parseParameterMap(req);
			
			
			//입력
			
			RoomDto rdto = new RoomDto();
			RoomDao rdao = new RoomDao();
			
			int room_no = rdao.getSequence();
			int pension_no = Integer.parseInt(map.get("pension_no").get(0).getString());
			
			rdto.setRoom_no(room_no);
			rdto.setRoom_pension_no(Integer.parseInt(map.get("pension_no").get(0).getString()));
			rdto.setRoom_name(map.get("room_name").get(0).getString());//get(0)=>1개의 데이터
			rdto.setRoom_type(map.get("room_type").get(0).getString());
			rdto.setStandard_people(Integer.parseInt(map.get("standard_people").get(0).getString()));
			rdto.setMax_people(Integer.parseInt(map.get("max_people").get(0).getString()));
			rdto.setRoom_width (Integer.parseInt(map.get("room_width").get(0).getString()));
			rdto.setToilet_count(Integer.parseInt(map.get("toilet_count").get(0).getString()));
			rdto.setOff_weekday(Integer.parseInt(map.get("off_weekday").get(0).getString()));
			rdto.setOff_weekend(Integer.parseInt(map.get("off_weekend").get(0).getString()));
			rdto.setOn_weekday(Integer.parseInt(map.get("on_weekday").get(0).getString()));
			rdto.setOn_weekend(Integer.parseInt(map.get("on_weekend").get(0).getString()));
			System.out.println(map);
			
			int amenity = Integer.parseInt(map.get("amenity").get(0).getString());
			rdto.setAmenity(amenity);
			int microwave = Integer.parseInt(map.get("microwave").get(0).getString());
			rdto.setMicrowave(microwave);
			int bed = Integer.parseInt(map.get("bed").get(0).getString());
			rdto.setBed(bed);
			int tv = Integer.parseInt(map.get("tv").get(0).getString());
			rdto.setTv(tv);
			int room_sofa = Integer.parseInt(map.get("room_sofa").get(0).getString());
			rdto.setRoom_sofa(room_sofa);
			int room_aircon = Integer.parseInt(map.get("room_aircon").get(0).getString());
			rdto.setRoom_aircon(room_aircon);
			int fridge = Integer.parseInt(map.get("fridge").get(0).getString());
			rdto.setFridge(fridge);
			int tub = Integer.parseInt(map.get("tub").get(0).getString());
			rdto.setTub(tub);
			int hairdryer = Integer.parseInt(map.get("hairdryer").get(0).getString());
			rdto.setHairdryer(hairdryer);
			int cookoo = Integer.parseInt(map.get("cookoo").get(0).getString());
			rdto.setCookoo(cookoo);
			int dog = Integer.parseInt(map.get("dog").get(0).getString());
			rdto.setDog(dog);
			
			rdao.regist(rdto);
			
			List<FileItem> fileList = map.get("room_image");
			RoomImageDao ridao = new RoomImageDao();
			for(FileItem item : fileList) {
				if(item.getSize()>0) {
					int room_image_no = ridao.getSequence();
					RoomImageDto ridto = new RoomImageDto();
					ridto.setRoom_image_no(room_image_no);
					ridto.setRoom_image_name(item.getName());
					ridto.setRoom_image_room_no(room_no);
					ridto.setRoom_image_size(item.getSize());
					ridto.setRoom_image_type(item.getContentType());
					ridao.save(ridto);
					
					File target = new File(baseDir,String.valueOf(room_image_no));
					item.write(target);
				}
			}

			resp.sendRedirect("room_list.jsp?pension_no="+pension_no);
		}catch(Exception e){
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
