package com.java.kosta;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/aboutSection", method = RequestMethod.GET)
	public String aboutSection(Locale locale, Model model) {
		logger.info("aboutSection Controller");
		
		return "menu/aboutSection";
	}
	
	@RequestMapping(value = "/portfolioSection", method = RequestMethod.GET)
	public String portfolioSection(Locale locale, Model model) {
		logger.info("portfolioSection Controller");
		
		return "menu/portfolioSection";
	}

	@RequestMapping(value = "/teamSection", method = RequestMethod.GET)
	public String teamSection(Locale locale, Model model) {
		logger.info("teamSection Controller");
		
		return "menu/teamSection";
	}
	
	@RequestMapping(value = "/talkToUsSection", method = RequestMethod.GET)
	public String talkToUsSection(Locale locale, Model model) {
		logger.info("talkToUsSection Controller");
		
		return "menu/talkToUsSection";
	}
	
	
}
