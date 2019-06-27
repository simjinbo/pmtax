package com.en.pmtax.taxinfo.contoller;

import java.util.ArrayList;
import com.en.pmtax.taxinfo.model.service.TaxinfoService;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.en.pmtax.taxinfo.model.vo.Taxinfo;

@Controller
public class TaxinfoController {
	// AdminService DI
	@Autowired
	private TaxinfoService TaxinfoService;
	
	@RequestMapping(value = "taxinfoList.do")
	public ModelAndView moveTaxinfoListMethod(ModelAndView mv, HttpServletRequest request) {
		
		ArrayList<Taxinfo> list = TaxinfoService.selectTaxinfoList();
		if (list != null) {
			System.out.println("DB다녀옴");
			mv.addObject("list", list);
			mv.setViewName("taxinfo/taxinfoList");
		} else {
			mv.addObject("message", "목록 조회에 실패하였습니다.");
			mv.setViewName("common/error");
		}
		return mv;
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
