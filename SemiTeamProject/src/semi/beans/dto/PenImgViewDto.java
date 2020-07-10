package semi.beans.dto;

public class PenImgViewDto {
	private int pension_seller_no;

	private int pension_no;
	private String pension_name;
	private String pension_regist_date;
	private int pen_img_no;
	private int pen_image_pen_no;
	private String pen_image_name;
	private long pen_image_size;
	private String pen_image_type;
	
	public PenImgViewDto() {
		super();
	}
	public int getPension_seller_no() {
		return pension_seller_no;
	}
	
	public void setPension_seller_no(int pension_seller_no) {
		this.pension_seller_no = pension_seller_no;
	}

	public int getPension_no() {
		return pension_no;
	}

	public void setPension_no(int pension_no) {
		this.pension_no = pension_no;
	}

	public String getPension_name() {
		return pension_name;
	}

	public void setPension_name(String pension_name) {
		this.pension_name = pension_name;
	}

	public String getPension_regist_date() {
		return pension_regist_date;
	}

	public void setPension_regist_date(String pension_regist_date) {
		this.pension_regist_date = pension_regist_date;
	}

	public int getPen_img_no() {
		return pen_img_no;
	}

	public void setPen_img_no(int pen_img_no) {
		this.pen_img_no = pen_img_no;
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

}
