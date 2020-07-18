package semi.beans.dto;

import java.sql.ResultSet;
import java.sql.SQLException;

public class LiveSearchDto {
	private int pension_no;
	private int room_pension_no;
	private String pension_name;
	

	private String pension_basic_addr;
	private String pension_phone;
	private int room_no;
	private String room_name;
	private String room_type;
	private int standard_people, max_people, room_width, toilet_count, off_weekday, off_weekend, on_weekday, on_weekend,
			amenity, microwave, bed, tv, room_sofa, room_aircon, fridge, tub, hairdryer, cookoo, dog;

	public LiveSearchDto() {
		super();
	}

	public LiveSearchDto(ResultSet rs)throws SQLException{
		this.setPension_no(rs.getInt("pension_no"));
		this.setPension_name(rs.getString("pension_name"));
		this.setPension_basic_addr(rs.getString("pension_basic_addr"));
		this.setPension_phone(rs.getString("pension_phone"));
		this.setRoom_no(rs.getInt("room_no"));
		this.setRoom_pension_no(rs.getInt("room_pension_no"));
		this.setRoom_name(rs.getString("room_name"));
		this.setRoom_type(rs.getString("room_type"));
		this.setStandard_people(rs.getInt("standard_people"));
		this.setMax_people(rs.getInt("max_people"));
		this.setRoom_width(rs.getInt("room_width"));
		this.setToilet_count(rs.getInt("toilet_count"));
		this.setOff_weekday(rs.getInt("off_weekday"));
		this.setOff_weekend(rs.getInt("off_weekend"));
		this.setOn_weekday(rs.getInt("on_weekday"));
		this.setOn_weekend(rs.getInt("on_weekend"));
		this.setAmenity(rs.getInt("amenity"));
		this.setMicrowave(rs.getInt("microwave"));
		this.setBed(rs.getInt("bed"));
		this.setTv(rs.getInt("tv"));
		this.setRoom_sofa(rs.getInt("room_sofa"));
		this.setRoom_aircon(rs.getInt("room_aircon"));
		this.setFridge(rs.getInt("fridge"));
		this.setTub(rs.getInt("tub"));
		this.setHairdryer(rs.getInt("hairdryer"));
		this.setCookoo(rs.getInt("cookoo"));
		this.setDog(rs.getInt("dog"));
		
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

	public int getRoom_pension_no() {
		return room_pension_no;
	}

	public void setRoom_pension_no(int room_pension_no) {
		this.room_pension_no = room_pension_no;
	}
	public String getPension_basic_addr() {
		return pension_basic_addr;
	}

	public void setPension_basic_addr(String pension_basic_addr) {
		this.pension_basic_addr = pension_basic_addr;
	}

	public String getPension_phone() {
		return pension_phone;
	}

	public void setPension_phone(String pension_phone) {
		this.pension_phone = pension_phone;
	}

	public int getRoom_no() {
		return room_no;
	}

	public void setRoom_no(int room_no) {
		this.room_no = room_no;
	}

	public String getRoom_name() {
		return room_name;
	}

	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}

	public String getRoom_type() {
		return room_type;
	}

	public void setRoom_type(String room_type) {
		this.room_type = room_type;
	}

	public int getStandard_people() {
		return standard_people;
	}

	public void setStandard_people(int standard_people) {
		this.standard_people = standard_people;
	}

	public int getMax_people() {
		return max_people;
	}

	public void setMax_people(int max_people) {
		this.max_people = max_people;
	}

	public int getRoom_width() {
		return room_width;
	}

	public void setRoom_width(int room_width) {
		this.room_width = room_width;
	}

	public int getToilet_count() {
		return toilet_count;
	}

	public void setToilet_count(int toilet_count) {
		this.toilet_count = toilet_count;
	}

	public int getOff_weekday() {
		return off_weekday;
	}

	public void setOff_weekday(int off_weekday) {
		this.off_weekday = off_weekday;
	}

	public int getOff_weekend() {
		return off_weekend;
	}

	public void setOff_weekend(int off_weekend) {
		this.off_weekend = off_weekend;
	}

	public int getOn_weekday() {
		return on_weekday;
	}

	public void setOn_weekday(int on_weekday) {
		this.on_weekday = on_weekday;
	}

	public int getOn_weekend() {
		return on_weekend;
	}

	public void setOn_weekend(int on_weekend) {
		this.on_weekend = on_weekend;
	}

	public int getAmenity() {
		return amenity;
	}

	public void setAmenity(int amenity) {
		this.amenity = amenity;
	}

	public int getMicrowave() {
		return microwave;
	}

	public void setMicrowave(int microwave) {
		this.microwave = microwave;
	}

	public int getBed() {
		return bed;
	}

	public void setBed(int bed) {
		this.bed = bed;
	}

	public int getTv() {
		return tv;
	}

	public void setTv(int tv) {
		this.tv = tv;
	}

	public int getRoom_sofa() {
		return room_sofa;
	}

	public void setRoom_sofa(int room_sofa) {
		this.room_sofa = room_sofa;
	}

	public int getRoom_aircon() {
		return room_aircon;
	}

	public void setRoom_aircon(int room_aircon) {
		this.room_aircon = room_aircon;
	}

	public int getFridge() {
		return fridge;
	}

	public void setFridge(int fridge) {
		this.fridge = fridge;
	}

	public int getTub() {
		return tub;
	}

	public void setTub(int tub) {
		this.tub = tub;
	}

	public int getHairdryer() {
		return hairdryer;
	}

	public void setHairdryer(int hairdryer) {
		this.hairdryer = hairdryer;
	}

	public int getCookoo() {
		return cookoo;
	}

	public void setCookoo(int cookoo) {
		this.cookoo = cookoo;
	}

	public int getDog() {
		return dog;
	}

	public void setDog(int dog) {
		this.dog = dog;
	}

}
