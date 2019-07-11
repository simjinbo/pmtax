package com.en.pmtax.admin.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.en.pmtax.admin.model.service.AdminService;
import com.en.pmtax.admin.model.vo.AdminQuestion;
import com.en.pmtax.admin.model.vo.AdminUser;

@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	/* 관리자유저리스트 */
	@RequestMapping("adminuser.do")
	public ModelAndView adminUserView(ModelAndView mv, AdminUser uPage){
		
		ArrayList<AdminUser> list = adminService.selectAdminUser(uPage);
		int count = adminService.selectUserCount(uPage);
		uPage.setTotalCount(count);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("count", count);
			mv.addObject("page", uPage);
			mv.setViewName("admin/adminUserList");
		}else {
			mv.addObject("count", 0);
			mv.setViewName("admin/adminUserList");
		}
		
		return mv;
	}
	
	/* 관리자유저상태변경 */
	@RequestMapping(value="adminuserupdate.do", method=RequestMethod.POST)
	public String adminUserUpdate(@RequestParam("user_no") int user_no) {
		
		int result = adminService.updateAdminUser(user_no);
		
		return "redirect:adminuser.do";
	}
	
	/* 관리자1대1문의리스트 */
	@RequestMapping("adminque.do")
	public ModelAndView  adminQuestionView(ModelAndView mv, AdminQuestion qPage){
		
		ArrayList<AdminQuestion> list = adminService.selectAdminQuestion(qPage);
		int count = adminService.selectQuestionCount(qPage);
		qPage.setTotalCount(count);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("count", count);
			mv.addObject("page", qPage);
			mv.setViewName("admin/adminQuestionList");
		}else {
			mv.addObject("count", 0);
			mv.setViewName("admin/adminQuestionList");
		}
		
		return mv;
	} 
	
	/* 관리자1대1문의 삭제 */
	@RequestMapping(value="adminquedel.do", method=RequestMethod.POST)
	public String adminQuestionDelete(HttpServletRequest request) {
		
		String[] checkArr = request.getParameterValues("delCheck");
		
		for(int i = 0; i < checkArr.length; i++) {
			int inquiry_no = Integer.parseInt(checkArr[i]);
			int result = adminService.deleteAdminQuestion(inquiry_no);
		}
		
		return "redirect:adminque.do";
	}
}
