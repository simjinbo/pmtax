package com.en.pmtax.taxinfo.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Taxinfo implements java.io.Serializable{

	private static final long serialVersionUID = 901023L;
	private int info_no;
	private String info_title;
	private String info_writer;
	private String file1;
	private String file2;
	private String file3;
	private String file4;
	private String file5;
	private String file6;
	private String info_contents;
	private Date info_date;
	private int hits;
	
	public Taxinfo() {}

	public Taxinfo(int info_no, String info_title, String info_writer, String file1, String file2, String file3,
			String file4, String file5, String file6, String info_contents, Date info_date, int hits) {
		super();
		this.info_no = info_no;
		this.info_title = info_title;
		this.info_writer = info_writer;
		this.file1 = file1;
		this.file2 = file2;
		this.file3 = file3;
		this.file4 = file4;
		this.file5 = file5;
		this.file6 = file6;
		this.info_contents = info_contents;
		this.info_date = info_date;
		this.hits = hits;
	}

	public int getInfo_no() {
		return info_no;
	}

	public void setInfo_no(int info_no) {
		this.info_no = info_no;
	}

	public String getInfo_title() {
		return info_title;
	}

	public void setInfo_title(String info_title) {
		this.info_title = info_title;
	}

	public String getInfo_writer() {
		return info_writer;
	}

	public void setInfo_writer(String info_writer) {
		this.info_writer = info_writer;
	}

	public String getFile1() {
		return file1;
	}

	public void setFile1(String file1) {
		this.file1 = file1;
	}

	public String getFile2() {
		return file2;
	}

	public void setFile2(String file2) {
		this.file2 = file2;
	}

	public String getFile3() {
		return file3;
	}

	public void setFile3(String file3) {
		this.file3 = file3;
	}

	public String getFile4() {
		return file4;
	}

	public void setFile4(String file4) {
		this.file4 = file4;
	}

	public String getFile5() {
		return file5;
	}

	public void setFile5(String file5) {
		this.file5 = file5;
	}

	public String getFile6() {
		return file6;
	}

	public void setFile6(String file6) {
		this.file6 = file6;
	}

	public String getInfo_contents() {
		return info_contents;
	}

	public void setInfo_contents(String info_contents) {
		this.info_contents = info_contents;
	}

	public Date getInfo_date() {
		return info_date;
	}

	public void setInfo_date(Date info_date) {
		this.info_date = info_date;
	}

	public int getHits() {
		return hits;
	}

	public void setHits(int hits) {
		this.hits = hits;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Taxinfo [info_no=" + info_no + ", info_title=" + info_title + ", info_writer=" + info_writer
				+ ", file1=" + file1 + ", file2=" + file2 + ", file3=" + file3 + ", file4=" + file4 + ", file5=" + file5
				+ ", file6=" + file6 + ", info_contents=" + info_contents + ", info_date=" + info_date + ", hits="
				+ hits + "]";
	}
	
}
