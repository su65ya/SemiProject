package semi.beans.dto;

public class ReservationStep3Dto {
	private int step3_no;
	private String bbq;
	private String adult;
	private String children;
	private int step2_no;

	public ReservationStep3Dto() {
		super();
	}

	public int getStep3_no() {
		return step3_no;
	}

	public void setStep3_no(int step3_no) {
		this.step3_no = step3_no;
	}

	public String getBbq() {
		return bbq;
	}

	public void setBbq(String bbq) {
		this.bbq = bbq;
	}

	public String getAdult() {
		return adult;
	}

	public void setAdult(String adult) {
		this.adult = adult;
	}

	public String getChildren() {
		return children;
	}

	public void setChildren(String children) {
		this.children = children;
	}

	public int getStep2_no() {
		return step2_no;
	}

	public void setStep2_no(int step2_no) {
		this.step2_no = step2_no;
	}

}
