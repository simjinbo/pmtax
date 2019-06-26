package com.en.pmtax.intro.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IntroController {

	@RequestMapping(value = "intro.do")
	public String moveAbouts() {
		return "intro/intro";
	}
	
}
