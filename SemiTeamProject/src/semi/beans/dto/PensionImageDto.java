package semi.beans.dto;

public class PensionImageDto {
	private int pen_image_no;
	private int pen_image_pen_no;
	private String pen_image_name;
	private long pen_image_size;
	private String pen_image_type;

	public int getPen_image_no() {
		return pen_image_no;
	}

	public void setPen_image_no(int pen_image_no) {
		this.pen_image_no = pen_image_no;
	}

	public int getPen_image_pen_no() {
		return pen_image_pen_no;
	}

	public void setPen_image_pen_no(int pen_image_pen_no) {
		this.pen_image_pen_no = pen_image_pen_no;
	}

	public String getPen_image_name() {
		return pen_image_name;
	}

	public void setPen_image_name(String pen_image_name) {
		this.pen_image_name = pen_image_name;
	}

	public long getPen_image_size() {
		return pen_image_size;
	}

	public void setPen_image_size(long pen_image_size) {
		this.pen_image_size = pen_image_size;
	}

	public String getPen_image_type() {
		return pen_image_type;
	}

	public void setPen_image_type(String pen_image_type) {
		this.pen_image_type = pen_image_type;
	}

	public PensionImageDto() {
		super();
	}
}
