package com.honhang.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {
	@RequestMapping("/index.do")
	public ModelAndView index() {
		return new ModelAndView("index");
	}

	@RequestMapping("/intro.do")
	public ModelAndView intro() {
		return new ModelAndView("intro");
	}

	@RequestMapping("/privacy.do")
	public ModelAndView privacy() {
		return new ModelAndView("privacy");
	}
	
	@RequestMapping("/terms.do")
	public ModelAndView terms() {
		return new ModelAndView("terms");
	}
}
