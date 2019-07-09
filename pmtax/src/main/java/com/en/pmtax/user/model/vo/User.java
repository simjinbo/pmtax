package com.en.pmtax.user.model.vo;

import org.springframework.stereotype.Component;

@Component
public class User  implements java.io.Serializable{
	private static final long serialVersionUID = 8904997664989334554L;
	
	private int user_no;
	private String user_id;
	private String user_pwd;
	private String user_name;
	private String user_email;
	private String birth;
	private String address;
	private String address_detail;
	private String gender;
	private String join_date;
	private String user_status;

	public User() {}

	public User(int user_no, String user_id, String user_pwd, String user_name, String user_email, String birth,
			String address, String address_detail, String gender, String join_date, String user_status) {
		super();
		this.user_no = user_no;
		this.user_id = user_id;
		this.user_pwd = user_pwd;
		this.user_name = user_name;
		this.user_email = user_email;
		this.birth = birth;
		this.address = address;
		this.address_detail = address_detail;
		this.gender = gender;
		this.join_date = join_date;
		this.user_status = user_status;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pwd() {
		return user_pwd;
	}

	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddress_detail() {
		return address_detail;
	}

	public void setAddress_detail(String address_detail) {
		this.address_detail = address_detail;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getJoin_date() {
		return join_date;
	}

	public void setJoin_date(String join_date) {
		this.join_date = join_date;
	}

	public String getUser_status() {
		return user_status;
	}

	public void setUser_status(String user_status) {
		this.user_status = user_status;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "User [user_no=" + user_no + ", user_id=" + user_id + ", user_pwd=" + user_pwd + ", user_name="
				+ user_name + ", user_email=" + user_email + ", birth=" + birth + ", address=" + address
				+ ", address_detail=" + address_detail + ", gender=" + gender + ", join_date=" + join_date
				+ ", user_status=" + user_status + "]";
	}
}
