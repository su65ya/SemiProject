package semi.beans.dto;

public class SellerStatisticsDto {
	private String pension_name;
	private String res_date;
	private int cnt;
	private int sum_price;

	public SellerStatisticsDto() {
		super();
	}

	public String getPension_name() {
		return pension_name;
	}

	public void setPension_name(String pension_name) {
		this.pension_name = pension_name;
	}

	public String getRes_date() {
		return res_date;
	}

	public void setRes_date(String res_date) {
		this.res_date = res_date;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public int getSum_price() {
		return sum_price;
	}

	public void setSum_price(int sum_price) {
		this.sum_price = sum_price;
	}

}
