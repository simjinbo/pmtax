package com.en.pmtax.inquiry.controller;

import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.en.pmtax.inquiry.model.service.InquiryService;
import com.en.pmtax.inquiry.model.vo.Inquiry;

@Controller
public class InquiryController {
	//InquiryService DI
	@Autowired
	private InquiryService inquiryService;
	
	
	@RequestMapping("inquiry.do")
	public String inquiryView() {
		return "inquiry/inquiry";
	}
	
	@RequestMapping(value="inquiryinsert.do", method=RequestMethod.POST)
	public String insertInquiry(Inquiry inquiry, Model model) {
		if(inquiryService.insertInquiry(inquiry) > 0) {
			return "common/main";
		}else {
			model.addAttribute("message", "문의 등록에 실패하였습니다.");
			return "common/error";
		}
	}
}
