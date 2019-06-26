package com.en.pmtax.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CommonController {

	@RequestMapping(value = "main.do", method = RequestMethod.GET)
	public String openMain() {				
		return "common/main";
	}
	
}
