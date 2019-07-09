package com.en.pmtax.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.en.pmtax.user.model.service.UserService;
import com.en.pmtax.user.model.vo.User;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "login.do")
	public String moveLogin() {
		return "user/login";
	}
	
	
	@RequestMapping(value = "ulogin.do", method=RequestMethod.POST)
	public String userLogin(User user,HttpSession session, SessionStatus status, 
			Model model,RedirectAttributes rttr) {
		
		User loginUser = userService.userLogin(user);
		
		
		if(loginUser != null) {
			session.setAttribute("loginUser", loginUser);
			status.setComplete();
			return "common/main";
		} else {
			session.setAttribute("loginUser", null);
			rttr.addFlashAttribute("message",false);
			status.setComplete();
			return "redirect:/login.do";
		}
	}
	
	@RequestMapping(value = "signup.do")
	public String userSignup(User user,HttpSession session, SessionStatus status, 
			Model model) {
		//int enrollUser =
		userService.enrollUser(user);
		
		return "redirect:/login.do";
	}
	
	@RequestMapping(value ="logout.do")
	public String userLogout(HttpServletRequest request) {
HttpSession session = request.getSession(false);
		
		if(session != null) {
			session.invalidate();
		}
		
		return "common/main";
	}
	
	@RequestMapping(value="ucheckid.do")
	@ResponseBody
	public int userCheckid(HttpServletRequest request, String userid) {
		int check = userService.checkDuplicate(userid);
		
		if(check > 0) {
			return 1;
		} else {
			return 0;
		}
	}
}
