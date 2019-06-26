package com.en.pmtax.taxinfo.contoller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TaxinfoController {
	@RequestMapping(value = "taxinfoList.do")
	public String moveTaxinfoListMethod() {
		return "taxinfo/taxinfoList";
	}
	
	@RequestMapping(value = "taxinfoDetail.do")
	public String moveTaxinfoDetailMethod() {
		return "taxinfo/taxinfoDetail";
	}

	@RequestMapping(value = "taxinfoWrite.do")
	public String moveTaxinfoWriteMethod() {
		return "taxinfo/taxinfoWrite";
	}
	
	@RequestMapping(value = "taxinfoUpdate.do")
	public String moveTaxinfoUpdateMethod() {
		return "taxinfo/taxinfoUpdate";
	}
}
