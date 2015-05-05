package com.mytest.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mytest.service.MemberService;
import com.mytest.DAO.Member;
import com.mytest.DAO.MemberDAOService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MainController {

	@Autowired
	private MemberService memberService;

	private static final Logger logger = LoggerFactory
			.getLogger(MainController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	/*
	 * public String main(Locale locale, Model model) {
	 * logger.info("Welcome main! The client locale is {}.", locale);
	 * System.out.println("Welcome main! The client locale is."+ locale); Date
	 * date = new Date(); DateFormat dateFormat =
	 * DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
	 * 
	 * String formattedDate = dateFormat.format(date);
	 * 
	 * model.addAttribute("serverTime", formattedDate ); Member member = new
	 * Member();
	 * 
	 * return "main"; }
	 */
	public ModelAndView main(HttpServletRequest request) {
		// HttpServletRequest를 이용하여 main.jsp로부터 값을 가져온다 getParameter로는 id값을 가져옴.

		// 아래부분은 select값을 result.jsp파일에 보여주기 위해 또사용.
		ModelAndView result = new ModelAndView();
		List<Member> memberList = memberService.getMember();
		System.out.println("MainController.java");
		result.addObject("result", memberList);
		result.setViewName("main");
		return result;
	}

}
