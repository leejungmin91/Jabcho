package com.mytest.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mytest.DAO.Member;
import com.mytest.DAO.MemberDAOService;

@Controller
public class MainController {
	@Autowired
	private MemberDAOService memberDAOService;
	private static final Logger logger = LoggerFactory
			.getLogger(MainController.class);
	

	@RequestMapping(value = "/main.do", method = RequestMethod.POST)
	public ModelAndView insert(HttpServletRequest request) {
		Member member = new Member();
		logger.debug("email = "+(String) request.getParameter("email"));
		logger.debug("memberDAO email = "+memberDAOService
				.getMemberEmail((String) request.getParameter("email")));
		if (((String) request.getParameter("email")).equals((memberDAOService
				.getMemberEmail((String) request.getParameter("email"))))) {
			logger.debug("Duplication name & email!!");
			ModelAndView result = new ModelAndView();
			List<Member> memberList = memberDAOService.getMemberName((String) request.getParameter("name"));
			result.addObject("result", memberList);
			result.setViewName("main");
			return result;
		} else {
			member.set_name((String) request.getParameter("name"));
			member.set_email((String) request.getParameter("email"));
			member.set_gender((String) request.getParameter("gender"));
			memberDAOService.insertMember(member);
			logger.debug("insert complet");
			ModelAndView result = new ModelAndView();
			List<Member> memberList = memberDAOService.getMemberName((String) request.getParameter("name"));
			result.addObject("result", memberList);
			result.setViewName("main");
			return result;
		}

	}
}