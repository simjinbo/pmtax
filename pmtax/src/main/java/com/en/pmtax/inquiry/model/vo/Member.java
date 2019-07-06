package com.en.pmtax.inquiry.model.vo;

import org.springframework.stereotype.Component;

@Component
public class Member implements java.io.Serializable {
	
	private static final long serialVersionUID = 930206L;
	
	private int member_no;
	private String member_name;
	private String member_picture;
	private String qualification;
	private String business_field;
	private int member_grade;
	
	public Member() {}

	public Member(int member_no, String member_name, String member_picture, String qualification, String business_field,
			int member_grade) {
		super();
		this.member_no = member_no;
		this.member_name = member_name;
		this.member_picture = member_picture;
		this.qualification = qualification;
		this.business_field = business_field;
		this.member_grade = member_grade;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_picture() {
		return member_picture;
	}

	public void setMember_picture(String member_picture) {
		this.member_picture = member_picture;
	}

	public String getQualification() {
		return qualification;
	}

	public void setQualification(String qualification) {
		this.qualification = qualification;
	}

	public String getBusiness_field() {
		return business_field;
	}

	public void setBusiness_field(String business_field) {
		this.business_field = business_field;
	}

	public int getMember_grade() {
		return member_grade;
	}

	public void setMember_grade(int member_grade) {
		this.member_grade = member_grade;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Member [member_no=" + member_no + ", member_name=" + member_name + ", member_picture=" + member_picture
				+ ", qualification=" + qualification + ", business_field=" + business_field + ", member_grade="
				+ member_grade + "]";
	}
	
}
