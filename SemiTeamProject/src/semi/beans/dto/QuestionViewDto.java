package semi.beans.dto;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Date;

public class QuestionViewDto {
	
	private int que_no, que_pension_no, que_writer, member_no, que_view, reply_writer;
	private String pension_name, member_id, que_head, que_title, que_content, que_date, que_reply;

	
	public QuestionViewDto() {
		super();
	}
	
	public QuestionViewDto(ResultSet rs) throws SQLException{
		this.setQue_no(rs.getInt("que_no"));
		this.setQue_pension_no(rs.getInt("que_pension_no"));
		this.setPension_name(rs.getString("pension_name"));
		this.setQue_writer(rs.getInt("que_writer"));
		this.setMember_no(rs.getInt("member_no"));
		this.setMember_id(rs.getString("member_id"));
		this.setQue_head(rs.getString("que_head"));
		this.setQue_title(rs.getString("que_title"));
		this.setQue_content(rs.getString("que_content"));
		this.setQue_date(rs.getString("que_date"));
		this.setQue_view(rs.getInt("que_view"));
		this.setReply_writer(rs.getInt("reply_writer"));
		this.setQue_reply(rs.getString("que_reply"));
		
	}


	public  int getQue_no() {
		return que_no;
	}


	public  void setQue_no(int que_no) {
		this.que_no = que_no;
	}


	public  int getQue_pension_no() {
		return que_pension_no;
	}


	public  void setQue_pension_no(int que_pension_no) {
		this.que_pension_no = que_pension_no;
	}


	public  int getQue_writer() {
		return que_writer;
	}


	public  void setQue_writer(int que_writer) {
		this.que_writer = que_writer;
	}


	public  int getMember_no() {
		return member_no;
	}


	public  void setMember_no(int member_no) {
		this.member_no = member_no;
	}


	public  int getQue_view() {
		return que_view;
	}


	public  void setQue_view(int que_view) {
		this.que_view = que_view;
	}


	public  int getReply_writer() {
		return reply_writer;
	}


	public  void setReply_writer(int reply_writer) {
		this.reply_writer = reply_writer;
	}


	public  String getPension_name() {
		return pension_name;
	}


	public  void setPension_name(String pension_name) {
		this.pension_name = pension_name;
	}


	public  String getMember_id() {
		return member_id;
	}


	public  void setMember_id(String member_id) {
		this.member_id = member_id;
	}


	public  String getQue_head() {
		return que_head;
	}


	public  void setQue_head(String que_head) {
		this.que_head = que_head;
	}


	public  String getQue_title() {
		return que_title;
	}


	public  void setQue_title(String que_title) {
		this.que_title = que_title;
	}


	public  String getQue_content() {
		return que_content;
	}


	public  void setQue_content(String que_content) {
		this.que_content = que_content;
	}


	public  String getQue_date() {
		return que_date;
	}


	public  void setQue_date(String que_date) {
		this.que_date = que_date;
	}
	
	// 시간
	public  String getQue_time() {
		return que_date.substring(11, 16);
	}
		
	// 날짜
	public String getQue_day() {
		return que_date.substring(0, 10);
	}

	// 날짜, 시간
	public String getQue_day_hour() {
		return que_date.substring(0, 16);
	}
	
	public String getQue_auto() {
		Date d = new Date();
		Format f = new SimpleDateFormat("yyyy-MM-dd");
		String today = f.format(d);
		
		if (getQue_day().equals(today)) {
			return getQue_time();
		}
		else {
			return getQue_day();
		}
					
	}


	public  String getQue_reply() {
		return que_reply;
	}


	public  void setQue_reply(String que_reply) {
		this.que_reply = que_reply;
	}

	
	
	
	
	
}
