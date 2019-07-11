package com.en.pmtax.admin.model.vo;

import java.sql.Date;
import java.sql.Timestamp;

import org.springframework.stereotype.Component;

@Component
public class AdminQuestion implements java.io.Serializable{

	private static final long serialVersionUID = 951019L;
	
	//1대1문의
	private int inquiry_no;
	private String name;
	private String email;
	private String phone;
	private String tell;
	private String content;
	private Date inquiry_date;
	
	//페이징
	private String page;
	private int currentPage = 1; 		//현재 페이지
	private int rowSize = 10;				//출력리스트 갯수
	private int pageSize = 5;				//출력페이지 갯수
	private int totalCount;				//총 글 갯수
	private int startPage = 1;			//시작 페이지
	private int endPage;					//끝 페이지
	private int maxPage;					//맨끝 페이지
	private int offset;						//offset 
	
	//필터
	private String searchname; 
	private String searchphone;
	private String startdate;
	private String enddate;
	
	public AdminQuestion() {}

	public AdminQuestion(int inquiry_no, String name, String email, String phone, String tell, String content,
			Date inquiry_date) {
		super();
		this.inquiry_no = inquiry_no;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.tell = tell;
		this.content = content;
		this.inquiry_date = inquiry_date;
	}
	
	public AdminQuestion(String page, int currentPage, int rowSize, int pageSize, int totalCount, int startPage,
			int endPage, int maxPage, int offset, String searchname, String searchphone, String startdate,
			String enddate) {
		super();
		this.page = page;
		this.currentPage = currentPage;
		this.rowSize = rowSize;
		this.pageSize = pageSize;
		this.totalCount = totalCount;
		this.startPage = startPage;
		this.endPage = endPage;
		this.maxPage = maxPage;
		this.offset = offset;
		this.searchname = searchname;
		this.searchphone = searchphone;
		this.startdate = startdate;
		this.enddate = enddate;
	}

	public int getInquiry_no() {
		return inquiry_no;
	}

	public void setInquiry_no(int inquiry_no) {
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

	public Date getInquiry_date() {
		return inquiry_date;
	}

	public void setInquiry_date(Date inquiry_date) {
		this.inquiry_date = inquiry_date;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	//필터
	public String getSearchname() {
		if(searchname == "") {
			searchname = null;
		}
		return searchname;
	}

	public void setSearchname(String searchname) {
		this.searchname = searchname;
	}

	public String getSearchphone() {
		if(searchphone == "") {
			searchphone = null;
		}
		return searchphone;
	}

	public void setSearchphone(String searchphone) {
		this.searchphone = searchphone;
	}

	public String getStartdate() {
		if(startdate == "") {
			startdate = null;
		}
		return startdate;
	}

	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}

	public String getEnddate() {
		if(enddate == "") {
			enddate = null;
		}
		return enddate;
	}

	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	
	// 페이지
	
	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}
	
	public int getCurrentPage() {
		if(getPage() != null && getPage() != "") {
		currentPage = Integer.parseInt(getPage());
		}
		
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getRowSize() {
		return rowSize;
	}

	public void setRowSize(int rowSize) {
		this.rowSize = rowSize;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getStartPage() {
		return ((getCurrentPage()-1) / getPageSize()) * getPageSize() + 1;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		int result = getStartPage() + getPageSize() - 1;
		
		if(result > getMaxPage())
			result = getMaxPage();
		
		return result;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	
	public int getOffset() {
		return getRowSize() * (getCurrentPage() - 1) ;
	}

	public void setOffset(int offset) {
		this.offset = offset;
	}

	public int getMaxPage() {
		return (getTotalCount() - 1) / getRowSize() + 1;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	@Override
	public String toString() {
		return "AdminQuestion [inquiry_no=" + inquiry_no + ", name=" + name + ", email=" + email + ", phone=" + phone
				+ ", tell=" + tell + ", content=" + content + ", inquiry_date=" + inquiry_date + ", page=" + page
				+ ", currentPage=" + currentPage + ", rowSize=" + rowSize + ", pageSize=" + pageSize + ", totalCount="
				+ totalCount + ", startPage=" + startPage + ", endPage=" + endPage + ", maxPage=" + maxPage
				+ ", offset=" + offset + ", searchname=" + searchname + ", searchphone=" + searchphone + ", startdate="
				+ startdate + ", enddate=" + enddate + "]";
	}



	
	
	
}
