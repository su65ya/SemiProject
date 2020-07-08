package semi.beans.dto;

public class RoomImageDto {
	private int room_image_no;   
	private int room_image_room_no; 
	private String room_image_name; 
	private long room_image_size; 
	private String room_image_type;
	
	public RoomImageDto() {
		super();
	}

	public int getRoom_image_no() {
		return room_image_no;
	}

	public void setRoom_image_no(int room_image_no) {
		this.room_image_no = room_image_no;
	}

	public int getRoom_image_room_no() {
		return room_image_room_no;
	}

	public void setRoom_image_room_no(int room_image_room_no) {
		this.room_image_room_no = room_image_room_no;
	}

	public String getRoom_image_name() {
		return room_image_name;
	}

	public void setRoom_image_name(String room_image_name) {
		this.room_image_name = room_image_name;
	}

	public long getRoom_image_size() {
		return room_image_size;
	}

	public void setRoom_image_size(long room_image_size) {
		this.room_image_size = room_image_size;
	}

	public String getRoom_image_type() {
		return room_image_type;
	}

	public void setRoom_image_type(String room_image_type) {
		this.room_image_type = room_image_type;
	}
	
}
