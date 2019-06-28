package com.en.pmtax.admin.controller;

import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.en.pmtax.admin.model.service.AdminService;

@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	@RequestMapping("adminuser.do")
	public String adminUserView(){
		return "admin/adminUserList";
	}
	
	@RequestMapping("adminque.do")
	public String adminQuestionView(){
		return "admin/adminQuestionList";
	} 
}
