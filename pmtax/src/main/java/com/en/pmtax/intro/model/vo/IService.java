package com.en.pmtax.intro.model.vo;

import org.springframework.stereotype.Component;

@Component
public class IService implements java.io.Serializable{
	private static final long serialVersionUID = -6352560860824234142L;
	
	private int service_no;
	private String service_title;
	private String service_contents;
	
	public IService() {}

	public IService(int service_no, String service_title, String service_contents) {
		super();
		this.service_no = service_no;
		this.service_title = service_title;
		this.service_contents = service_contents;
	}

	public int getService_no() {
		return service_no;
	}

	public void setService_no(int service_no) {
		this.service_no = service_no;
	}

	public String getService_title() {
		return service_title;
	}

	public void setService_title(String service_title) {
		this.service_title = service_title;
	}

	public String getService_contents() {
		return service_contents;
	}

	public void setService_contents(String service_contents) {
		this.service_contents = service_contents;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "IService [service_no=" + service_no + ", service_title=" + service_title + ", service_contents="
				+ service_contents + "]";
	}
}
