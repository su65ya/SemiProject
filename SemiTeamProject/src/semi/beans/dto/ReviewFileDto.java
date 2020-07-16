package semi.beans.dto;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ReviewFileDto {
	private int review_file_no;
	private int review_origin;
	private String review_file_name;
	private long review_file_size;
	private String review_file_type;
	
	public ReviewFileDto() {
		super();
	}
	
	public ReviewFileDto(ResultSet rs) throws SQLException{
		this.setReview_file_no(rs.getInt("review_file_no"));
		this.setReview_origin(rs.getInt("review_origin"));
		this.setReview_file_name(rs.getString("review_file_name"));
		this.setReview_file_size(rs.getLong("review_file_size"));
		this.setReview_file_type(rs.getString("review_file_type"));
	}

	public int getReview_file_no() {
		return review_file_no;
	}

	public void setReview_file_no(int review_file_no) {
		this.review_file_no = review_file_no;
	}

	public int getReview_origin() {
		return review_origin;
	}

	public void setReview_origin(int review_origin) {
		this.review_origin = review_origin;
	}

	public String getReview_file_name() {
		return review_file_name;
	}

	public void setReview_file_name(String review_file_name) {
		this.review_file_name = review_file_name;
	}

	public long getReview_file_size() {
		return review_file_size;
	}

	public void setReview_file_size(long review_file_size) {
		this.review_file_size = review_file_size;
	}

	public String getReview_file_type() {
		return review_file_type;
	}

	public void setReview_file_type(String review_file_type) {
		this.review_file_type = review_file_type;
	}
	

}
