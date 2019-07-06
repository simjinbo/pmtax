package com.en.pmtax.inquiry.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.en.pmtax.inquiry.model.service.InquiryService;
import com.en.pmtax.inquiry.model.vo.Inquiry;
import com.en.pmtax.inquiry.model.vo.Member;

@Controller
public class InquiryController {
	//InquiryService DI
	@Autowired
	private InquiryService inquiryService;
	
	//inquiry =========================================================	
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
	
	//intro =========================================================
	@RequestMapping("introduceMember.do")
	public ModelAndView selectIntroduceMemberView(
			ModelAndView mv) {
		ArrayList<Member> member = inquiryService.selectIntroduceMemberView();
		if(member != null) {
			mv.addObject("member", member);
			mv.setViewName("inquiry/introduceMember");					
		}else {
			mv.addObject("message", "구성원 조회에 실패하였습니다.");
			mv.setViewName("common/error");				
		}
		
		return mv;
	}
	
	//admin =========================================================	
	@RequestMapping("adminIntroduceMember.do")
	public ModelAndView selectAdminIntroduceMemberView(
			ModelAndView mv) {
		ArrayList<Member> member = inquiryService.selectIntroduceMemberView();
		if(member != null) {
			mv.addObject("member", member);
			mv.setViewName("inquiry/adminIntroduceMember");					
		}else {
			mv.addObject("message", "구성원 조회에 실패하였습니다.");
			mv.setViewName("common/error");				
		}
		
		return mv;
	}	
	
	@RequestMapping(value="memberInsert.do", method=RequestMethod.POST)
	public String insertMember(Member member, MultipartHttpServletRequest mtpRequest, @RequestParam(name="sh_profile", required=false) MultipartFile member_picture, Model model) {
		if(member_picture != null) {
			String path = mtpRequest.getSession().getServletContext().getRealPath("files/introduceMember");
			String saveFile = path + "\\" + System.currentTimeMillis() + member_picture.getOriginalFilename();
			try {
				if(member_picture.getOriginalFilename() != "" && member_picture.getSize() != 0) {
					member_picture.transferTo(new File(saveFile));
					member.setMember_picture(saveFile.substring(saveFile.lastIndexOf("\\")+1));
				}
        	} catch (IllegalStateException e) {
        		e.printStackTrace();
        	} catch (IOException e) {
        		e.printStackTrace();
        	}
		}
		
		if(inquiryService.insertMember(member) > 0) {
			return "redirect:adminIntroduceMember.do";
		}else {
			model.addAttribute("message", "구성원 등록에 실패하였습니다.");
			return "common/error";
		}
	}
	
	@RequestMapping(value="memberUpdate.do", method=RequestMethod.POST)
	public void updateMember(@RequestBody String param, HttpServletResponse response) throws ParseException {
		JSONParser jparser = new JSONParser();
		JSONObject job = (JSONObject)jparser.parse(param);	
		
		int member_no = Integer.parseInt(job.get("member_no").toString());
		String member_name = (String)job.get("member_name");
		String qualification = (String)job.get("qualification");
		String business_field = (String)job.get("business_field");
		int member_grade = Integer.parseInt(job.get("member_grade").toString());
		
		Member member = new Member();
		member.setMember_no(member_no);
		member.setMember_name(member_name);
		member.setQualification(qualification);
		member.setBusiness_field(business_field);
		member.setMember_grade(member_grade);
		
		int result = inquiryService.updateMember(member);
		String sresult = Integer.toString(result);
		
		response.setContentType("text/html; charset=utf-8");	
		try {
			PrintWriter out = response.getWriter();
			out.append(sresult);
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}
	
	@RequestMapping(value="memberDelete.do", method=RequestMethod.POST)
	public void deleteMember(@RequestBody String param, HttpServletResponse response) throws ParseException {
		JSONParser jparser = new JSONParser();
		JSONObject job = (JSONObject)jparser.parse(param);	
		
		int member_no = Integer.parseInt(job.get("member_no").toString());
		
		int result = inquiryService.deleteMember(member_no);
		String sresult = Integer.toString(result);
		
		response.setContentType("text/html; charset=utf-8");	
		try {
			PrintWriter out = response.getWriter();
			out.append(sresult);
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}
}
