package com.en.pmtax.intro.model.vo;

import org.springframework.stereotype.Component;

@Component
public class Intro implements java.io.Serializable{

	private static final long serialVersionUID = 1746986477538890664L;
	
	private String intro_title;
	private String address;
	private String email;
	private String phone;
	private String contents;
	private String intro_img;
	private String pax;
	
	public Intro() {}

	public Intro(String intro_title, String address, String email, String phone, String contents, String intro_img,
			String pax) {
		super();
		this.intro_title = intro_title;
		this.address = address;
		this.email = email;
		this.phone = phone;
		this.contents = contents;
		this.intro_img = intro_img;
		this.pax = pax;
	}

	public String getIntro_title() {
		return intro_title;
	}

	public void setIntro_title(String intro_title) {
		this.intro_title = intro_title;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getIntro_img() {
		return intro_img;
	}

	public void setIntro_img(String intro_img) {
		this.intro_img = intro_img;
	}

	public String getPax() {
		return pax;
	}

	public void setPax(String pax) {
		this.pax = pax;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Intro [intro_title=" + intro_title + ", address=" + address + ", email=" + email + ", phone=" + phone
				+ ", contents=" + contents + ", intro_img=" + intro_img + ", pax=" + pax + "]";
	}
	
	
}
