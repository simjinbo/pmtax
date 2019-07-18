package com.en.pmtax.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
	
	
	@Autowired
	BCryptPasswordEncoder bcyptPasswordEncoder;
	
	@RequestMapping(value = "login.do")
	public String moveLogin() {
		return "user/login";
	}
	
	
	@RequestMapping(value = "ulogin.do", method=RequestMethod.POST)
	public String userLogin(User user,HttpSession session, SessionStatus status, 
			Model model,RedirectAttributes rttr) {
		String dUserPwd = bcyptPasswordEncoder.encode(user.getUser_pwd());
		User loginUser = userService.userLogin(user);
		//System.out.println("login : " + bcyptPasswordEncoder.matches(user.getUser_pwd(), dUserPwd));
		
	
		if(loginUser != null && (bcyptPasswordEncoder.matches(user.getUser_pwd(), dUserPwd) == true)) {
			
			session.setAttribute("loginUser", loginUser);
			status.setComplete();
			return "common/main";
		} else {
			System.out.println("else로 왔음");
			session.setAttribute("loginUser", null);
			rttr.addFlashAttribute("message",false);
			status.setComplete();
			return "redirect:/login.do";
		}
	}
	
	@RequestMapping(value = "signup.do")
	public String userSignup(User user,HttpSession session, SessionStatus status, 
			Model model) {
		/*user.setUser_pwd(bcyptPasswordEncoder.encode("admin"));
		user.setUser_id("admin");*/
		userService.enrollUser(user);
		
		return "redirect:/login.do";
	}
	
	@RequestMapping(value ="logout.do")
	public String userLogout(HttpServletRequest request) {
HttpSession session = request.getSession(false);
		String referer = request.getHeader("Referer");
		if(session != null) {
			session.invalidate();
		}
		
		return "redirect:"+referer;
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
