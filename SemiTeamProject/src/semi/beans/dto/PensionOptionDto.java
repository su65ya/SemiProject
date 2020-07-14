package semi.beans.dto;

public class PensionOptionDto {
	private int option_no;
	private int pension_key;
	private String option_name;
	private int option_price;
	private int option_select;

	public int getOption_no() {
		return option_no;
	}

	public void setOption_no(int option_no) {
		this.option_no = option_no;
	}

	public int getPension_key() {
		return pension_key;
	}

	public void setPension_key(int pension_key) {
		this.pension_key = pension_key;
	}

	public String getOption_name() {
		return option_name;
	}

	public void setOption_name(String option_name) {
		this.option_name = option_name;
	}

	public int getOption_price() {
		return option_price;
	}

	public void setOption_price(int option_price) {
		this.option_price = option_price;
	}

	public int getOption_select() {
		return option_select;
	}

	public void setOption_select(int option_select) {
		this.option_select = option_select;
	}

	public PensionOptionDto() {
		super();
	}
}
