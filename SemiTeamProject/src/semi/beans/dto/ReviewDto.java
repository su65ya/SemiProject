package semi.beans.dto;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Date;

public class ReviewDto {
	
	private int review_no, review_writer, review_pension_no, review_res_no, review_count;
	private String review_title, review_content, review_date;
	
	
	public ReviewDto() {
		super();
	}
	
	public ReviewDto(ResultSet rs) throws SQLException {
		this.setReview_no(rs.getInt("review_no"));
		this.setReview_writer(rs.getInt("review_writer"));
		this.setReview_pension_no(rs.getInt("review_pension_no"));
		this.setReview_res_no(rs.getInt("review_res_no"));
		this.setReview_title(rs.getString("review_title"));
		this.setReview_content(rs.getString("review_content"));
		this.setReview_date(rs.getString("review_date"));
		this.setReview_count(rs.getInt("review_count"));
		
	}
	


	public int getReview_no() {
		return review_no;
	}


	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}


	public int getReview_writer() {
		return review_writer;
	}


	public void setReview_writer(int review_writer) {
		this.review_writer = review_writer;
	}


	public int getReview_pension_no() {
		return review_pension_no;
	}


	public void setReview_pension_no(int review_pension_no) {
		this.review_pension_no = review_pension_no;
	}


	public int getReview_res_no() {
		return review_res_no;
	}


	public void setReview_res_no(int review_res_no) {
		this.review_res_no = review_res_no;
	}


	public int getReview_count() {
		return review_count;
	}


	public void setReview_count(int review_count) {
		this.review_count = review_count;
	}


	public String getReview_title() {
		return review_title;
	}


	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}


	public String getReview_content() {
		return review_content;
	}


	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}


	public String getReview_date() {
		return review_date;
	}


	public void setReview_date(String review_date) {
		this.review_date = review_date;
	}
	
	// 시간
		public  String getReview_time() {
			return review_date.substring(11, 16);
		}
			
		// 날짜
		public String getReview_day() {
			return review_date.substring(0, 10);
		}

		public String getReview_auto() {
			Date d = new Date();
			Format f = new SimpleDateFormat("yyyy-MM-dd");
			String today = f.format(d);
			
			if (getReview_day().equals(today)) {
				return getReview_time();
			}
			else {
				return getReview_day();
			}
						
		}

	
	
}
