package com.en.pmtax.inquiry.model.vo;

import org.springframework.stereotype.Component;

@Component
public class Inquiry implements java.io.Serializable {
	
	private static final long serialVersionUID = 930205L;
	
	private String inquiry_no;
	private String name;
	private String email;
	private String phone;
	private String tell;
	private String content;
	private String inquiry_date;
	private String user_no;
	
	public Inquiry() {}

	public Inquiry(String inquiry_no, String name, String email, String phone, String tell, String content,
			String inquiry_date, String user_no) {
		super();
		this.inquiry_no = inquiry_no;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.tell = tell;
		this.content = content;
		this.inquiry_date = inquiry_date;
		this.user_no = user_no;
	}

	public String getInquiry_no() {
		return inquiry_no;
	}

	public void setInquiry_no(String inquiry_no) {
		this.inquiry_no = inquiry_no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public String getTell() {
		return tell;
	}

	public void setTell(String tell) {
		this.tell = tell;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getInquiry_date() {
		return inquiry_date;
	}

	public void setInquiry_date(String inquiry_date) {
		this.inquiry_date = inquiry_date;
	}

	public String getUser_no() {
		return user_no;
	}

	public void setUser_no(String user_no) {
		this.user_no = user_no;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Inquiry [inquiry_no=" + inquiry_no + ", name=" + name + ", email=" + email + ", phone=" + phone
				+ ", tell=" + tell + ", content=" + content + ", inquiry_date=" + inquiry_date + ", user_no=" + user_no
				+ "]";
	}
	
}
