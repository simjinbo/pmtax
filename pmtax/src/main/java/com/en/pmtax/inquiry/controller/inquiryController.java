package com.en.pmtax.inquiry.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class inquiryController {

	
	@RequestMapping("inquiry.do")
	public String inquiryView() {
		return "inquiry/inquiry";
	}
}
