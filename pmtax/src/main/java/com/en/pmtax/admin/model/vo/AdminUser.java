package com.en.pmtax.admin.model.vo;

import java.sql.Date;
import java.sql.Timestamp;

import org.springframework.stereotype.Component;

@Component
public class AdminUser implements java.io.Serializable{

	private static final long serialVersionUID = 951018L;

	//유저
	private int user_no;
	private String user_id;
	private String user_pwd;
	private String user_name;
	private String user_email;
	private Date birth;
	private String address;
	private String address_detail;
	private String phone;
	private String cellphone;
	private String gender;
	private Date join_date;
	private String user_status;
	
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
	private String userstatus = "이용중";
	private String searchid;
	private String searchphone;
	private String startdate;
	private String enddate;
	
	public AdminUser() {}

	public AdminUser(int user_no, String user_id, String user_pwd, String user_name, String user_email, Date birth,
			String address, String address_detail, String phone, String cellphone, String gender, Date join_date,
			String user_status) {
		super();
		this.user_no = user_no;
		this.user_id = user_id;
		this.user_pwd = user_pwd;
		this.user_name = user_name;
		this.user_email = user_email;
		this.birth = birth;
		this.address = address;
		this.address_detail = address_detail;
		this.phone = phone;
		this.cellphone = cellphone;
		this.gender = gender;
		this.join_date = join_date;
		this.user_status = user_status;
	}

	public AdminUser(String page, int currentPage, int rowSize, int pageSize, int totalCount, int startPage,
			int endPage, int maxPage, int offset, String userstatus, String searchid, String searchphone,
			String startdate, String enddate) {
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
		this.userstatus = userstatus;
		this.searchid = searchid;
		this.searchphone = searchphone;
		this.startdate = startdate;
		this.enddate = enddate;
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

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}
	
	public String getAddress_detail() {
		return address_detail;
	}

	public void setAddress_detail(String address_detail) {
		this.address_detail = address_detail;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getCellphone() {
		return cellphone;
	}

	public void setCellphone(String cellphone) {
		this.cellphone = cellphone;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getJoin_date() {
		return join_date;
	}

	public void setJoin_date(Date join_date) {
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
	
	// 필터
	
	public String getUserstatus() {
		return userstatus;
	}

	public void setUserstatus(String userstatus) {
		this.userstatus = userstatus;
	}

	public String getSearchid() {
		if(searchid == "") {
			searchid = null;
		}
		return searchid;
	}

	public void setSearchid(String searchid) {
		this.searchid = searchid;
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
		return "AdminUser [user_no=" + user_no + ", user_id=" + user_id + ", user_pwd=" + user_pwd + ", user_name="
				+ user_name + ", user_email=" + user_email + ", birth=" + birth + ", address=" + address
				+ ", address_detail=" + address_detail + ", phone=" + phone + ", cellphone=" + cellphone + ", gender="
				+ gender + ", join_date=" + join_date + ", user_status=" + user_status + ", page=" + page
				+ ", currentPage=" + currentPage + ", rowSize=" + rowSize + ", pageSize=" + pageSize + ", totalCount="
				+ totalCount + ", startPage=" + startPage + ", endPage=" + endPage + ", maxPage=" + maxPage
				+ ", offset=" + offset + ", userstatus=" + userstatus + ", searchid=" + searchid + ", searchphone="
				+ searchphone + ", startdate=" + startdate + ", enddate=" + enddate + "]";
	}


	
	
}
