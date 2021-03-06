package semi.beans.dto;

public class PensionInfoDto {
	private int pension_no;
	private int pension_seller_no;
	private String seller_id;
	private String pension_name;
	private String pension_post;
	private String pension_basic_addr;
	private String pension_detail_addr;
	private String pension_intro;
	private String pension_phone;
	private String pension_regist_date;

	public PensionInfoDto() {
		super();
	}

	public int getPension_no() {
		return pension_no;
	}

	public void setPension_no(int pension_no) {
		this.pension_no = pension_no;
	}

	public int getPension_seller_no() {
		return pension_seller_no;
	}

	public void setPension_seller_no(int pension_seller_no) {
		this.pension_seller_no = pension_seller_no;
	}

	public String getSeller_id() {
		return seller_id;
	}

	public void setSeller_id(String seller_id) {
		this.seller_id = seller_id;
	}

	public String getPension_name() {
		return pension_name;
	}

	public void setPension_name(String pension_name) {
		this.pension_name = pension_name;
	}

	public String getPension_post() {
		return pension_post;
	}

	public void setPension_post(String pension_post) {
		this.pension_post = pension_post;
	}

	public String getPension_basic_addr() {
		return pension_basic_addr;
	}

	public void setPension_basic_addr(String pension_basic_addr) {
		this.pension_basic_addr = pension_basic_addr;
	}

	public String getPension_detail_addr() {
		return pension_detail_addr;
	}

	public void setPension_detail_addr(String pension_detail_addr) {
		this.pension_detail_addr = pension_detail_addr;
	}

	public String getPension_intro() {
		return pension_intro;
	}

	public void setPension_intro(String pension_intro) {
		this.pension_intro = pension_intro;
	}

	public String getPension_phone() {
		return pension_phone;
	}

	public void setPension_phone(String pension_phone) {
		this.pension_phone = pension_phone;
	}

	public String getPension_regist_date() {
		return pension_regist_date;
	}

	public void setPension_regist_date(String pension_regist_date) {
		this.pension_regist_date = pension_regist_date;
	}
	
	// yyyy-MM-dd방식
	public String getPension_regist_date_day() {
		return pension_regist_date.substring(0, 10);
	}

	// 00:00:00방식
	public String getPension_regist_date_time() {
		return pension_regist_date.substring(11, 16);
	}

}
