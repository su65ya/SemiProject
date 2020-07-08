package semi.beans.dto;

import java.sql.ResultSet;
import java.sql.SQLException;

public class QuestionDto {
	
	private int que_no, que_reply, que_view, group_no, super_no, depth, que_write;
	private String que_head, que_title, que_content, que_date;
	
	
	public QuestionDto() {
		super();
	}

	public QuestionDto(ResultSet rs) throws SQLException {
		this.setQue_no(rs.getInt("que_no"));
		this.setQue_head(rs.getString("que_head"));
		this.setQue_title(rs.getString("que_title"));
		this.setQue_content(rs.getString("que_content"));
		this.setQue_date(rs.getString("que_date"));
		this.setQue_reply(rs.getInt("que_reply"));
		this.setQue_view(rs.getInt("que_view"));
		this.setGroup_no(rs.getInt("group_no"));
		this.setSuper_no(rs.getInt("super_no"));
		this.setDepth(rs.getInt("depth"));
		this.setQue_write(rs.getInt("que_write"));
		
	}

	public final int getQue_no() {
		return que_no;
	}

	public final void setQue_no(int que_no) {
		this.que_no = que_no;
	}

	public final int getQue_reply() {
		return que_reply;
	}

	public final void setQue_reply(int que_reply) {
		this.que_reply = que_reply;
	}

	public final int getQue_view() {
		return que_view;
	}

	public final void setQue_view(int que_view) {
		this.que_view = que_view;
	}

	public final int getGroup_no() {
		return group_no;
	}

	public final void setGroup_no(int group_no) {
		this.group_no = group_no;
	}

	public final int getSuper_no() {
		return super_no;
	}

	public final void setSuper_no(int super_no) {
		this.super_no = super_no;
	}

	public final int getDepth() {
		return depth;
	}

	public final void setDepth(int depth) {
		this.depth = depth;
	}

	public final int getQue_write() {
		return que_write;
	}

	public final void setQue_write(int que_write) {
		this.que_write = que_write;
	}

	public final String getQue_head() {
		return que_head;
	}

	public final void setQue_head(String que_head) {
		this.que_head = que_head;
	}

	public final String getQue_title() {
		return que_title;
	}

	public final void setQue_title(String que_title) {
		this.que_title = que_title;
	}

	public final String getQue_content() {
		return que_content;
	}

	public final void setQue_content(String que_content) {
		this.que_content = que_content;
	}

	public final String getQue_date() {
		return que_date.substring(0, 10);
	}

	public final void setQue_date(String que_date) {
		this.que_date = que_date;
	}
	

	

}
