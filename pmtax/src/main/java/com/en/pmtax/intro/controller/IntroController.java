package com.en.pmtax.intro.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.en.pmtax.intro.model.service.IntroService;
import com.en.pmtax.intro.model.vo.Intro;
import com.en.pmtax.intro.model.vo.IService;

@Controller
public class IntroController {
	private static final String ArrayList = null;
	@Autowired
	private IntroService introService;
	
	@RequestMapping(value = "intro.do")
	public ModelAndView moveAbouts() {
		Intro intro = introService.getIntro();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("intro/intro");
		mv.addObject("intro", intro);
		return mv;
	}
	
	@RequestMapping(value = "service.do")
	public String moveService() {
		return "intro/service";
	}
	
	//업무소개 리스트 출력
	@RequestMapping(value="serviceList.do", method=RequestMethod.POST)
	@ResponseBody
	public ArrayList<IService> getServcieList() {
		ArrayList<IService> slist = introService.getServiceList();
		
		return slist;
	}
	
	//업무소개 작성 컨트롤러
	@RequestMapping(value="iservice.do", method=RequestMethod.POST)
	public String insertService(IService service) {
		int result = introService.insertService(service);
		
		return "intro/service";
	}
	//업무소개 수정 컨트롤러
	@RequestMapping(value="uservice.do")
	public String updateService(IService iservice) {
		System.out.println("update : " + iservice);
		
		int result = introService.updateService(iservice); 
		
		return "intro/service";
	}
	
	//업무소개 삭제 컨트롤러
	@RequestMapping(value="dservice.do")
	public String deleteService(int service_no) {
		int result = introService.deleteService(service_no);
		
		if(result > 0) {
		
		return "intro/service";
		}else {
		System.out.println("삭제실패");
		return "intro/service";
		}
	}
	
	
	@RequestMapping(value = "contact.do")
	public String moveContact() {
		return "intro/contact";
	}
}
