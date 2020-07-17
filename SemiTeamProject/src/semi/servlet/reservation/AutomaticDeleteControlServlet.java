package semi.servlet.reservation;

import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import semi.beans.dao.ReservationFlowDao;

/**
 * 서블릿에서 사용할 수 있는 메소드는 3종류
 * - init() : 최초 1회 실행할 내용 작성
 * - service() : 요청 때마다 실행할 내용 작성
 * - destroy() : 마지막 1회 실행할 내용 작성
 *
 */
public class AutomaticDeleteControlServlet extends HttpServlet{
	Timer t;
	@Override
	public void init() throws ServletException {
		//일정 시간마다 임시 예약 내역 삭제 메소드를 실행하는 일꾼을 등록하고 실행
		//Thread : 하나의 작업을 독립적으로 수행할 수 있는 도구
		ReservationFlowDao rfdao = new ReservationFlowDao();
		TimerTask task = new TimerTask() {
			@Override
			public void run() {
				try {
					rfdao.reservationAutoDeleter();
				}
				catch(Exception e) {
					e.printStackTrace();
				}
			}
		};
		t = new Timer();
		t.scheduleAtFixedRate(task, 0L, 600000L);
	}
	
	@Override
	public void destroy() {
		//일꾼 죽이기
		t.cancel();
	}
}
