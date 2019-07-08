package com.en.pmtax.common.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.en.pmtax.common.model.service.CommonService;
import com.en.pmtax.taxinfo.model.vo.Taxinfo;

@Controller
public class CommonController {

	@Autowired
	private CommonService commonService;
	
	@RequestMapping(value = "main.do", method = RequestMethod.GET)
	public ModelAndView openMain(ModelAndView mv, HttpServletRequest request) {		
		
	/*	ArrayList<Taxinfo> list = commonService.selectTaxinfoTop10();
		if (list != null) {
			System.out.println("메인도 DB다녀옴");
			mv.addObject("list", list);
			mv.setViewName("common/main");
		} else {
			mv.addObject("message", "목록 조회에 실패하였습니다.");
			mv.setViewName("common/error");
		}*/
		
		mv.setViewName("common/main");
		
		return mv;
	}
	
}
