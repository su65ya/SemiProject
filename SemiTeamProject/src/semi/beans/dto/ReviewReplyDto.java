package semi.beans.dto;

import java.sql.ResultSet;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Date;

public class ReviewReplyDto {
	private int reply_no;
	private int reply_writer;
	private int reply_origin;
	private String reply_content;
	private String reply_date;

	public ReviewReplyDto() {
		super();
	}
	public ReviewReplyDto(ResultSet rs) throws Exception{
		this.setReply_no(rs.getInt("reply_no"));
		this.setReply_writer(rs.getInt("reply_writer"));
		this.setReply_origin(rs.getInt("reply_origin"));
		this.setReply_content(rs.getString("reply_content"));
		this.setReply_date(rs.getString("reply_date"));
	}
	public int getReply_no() {
		return reply_no;
	}
	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
	}
	public int getReply_writer() {
		return reply_writer;
	}
	public void setReply_writer(int reply_writer) {
		this.reply_writer = reply_writer;
	}
	public int getReply_origin() {
		return reply_origin;
	}
	public void setReply_origin(int reply_origin) {
		this.reply_origin = reply_origin;
	}
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	public String getReply_date() {
		return reply_date;
	}
	public void setReply_date(String reply_date) {
		this.reply_date = reply_date;
	}
	// 시간
			public  String getReply_time() {
				return reply_date.substring(11, 16);
			}
				
			// 날짜
			public String getReply_day() {
				return reply_date.substring(0, 10);
			}

			public String getReply_auto() {
				Date d = new Date();
				Format f = new SimpleDateFormat("yyyy-MM-dd");
				String today = f.format(d);
				
				if (getReply_day().equals(today)) {
					return getReply_time();
				}
				else {
					return getReply_day();
				}
							
			}
	
	
}
