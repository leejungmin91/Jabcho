package com.mytest.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mytest.DAO.FileDAOService;
import com.mytest.DAO.MemberDAOService;
import com.mytest.DTO.FileDTO;
import com.mytest.DTO.MemberDTO;

@Controller
public class MainController {
	@Autowired
	private MemberDAOService memberDAOService;
	@Autowired
	private FileDAOService fileDAOService;
	private static final Logger logger = LoggerFactory
			.getLogger(MainController.class);
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public ModelAndView get(HttpServletRequest request) {
		ModelAndView result = new ModelAndView();
		result.setViewName("home");
		return result;
	}

	@RequestMapping(value = "/main", method = RequestMethod.POST)
	public ModelAndView insert(HttpServletRequest request, HttpSession session) {
		ArrayList<FileDTO> list = fileDAOService.getFile();
		MemberDTO member = new MemberDTO();
		logger.info("email = " + (String) request.getParameter("email"));
		logger.info("memberDAO email = "
				+ memberDAOService.getMemberEmail((String) request
						.getParameter("email")));
		if (((String) request.getParameter("email")).equals((memberDAOService
				.getMemberEmail((String) request.getParameter("email"))))) {
			logger.info("Duplication name & email!!");
			ModelAndView result = new ModelAndView();
			List<MemberDTO> memberList = memberDAOService
					.getMemberName((String) request.getParameter("name"));
			// result.addObject("result", memberList);
			result.setViewName("main");
			session.setAttribute("result", memberList);
			session.setAttribute("list", list);
			return result;
		} else {
			member.set_name((String) request.getParameter("name"));
			member.set_email((String) request.getParameter("email"));
			member.set_gender((String) request.getParameter("gender"));
			memberDAOService.insertMember(member);
			logger.info("insert complet");
			ModelAndView result = new ModelAndView();
			List<MemberDTO> memberList = memberDAOService
					.getMemberName((String) request.getParameter("name"));
			// result.addObject("result", memberList);
			result.setViewName("main");
			session.setAttribute("result", memberList);
			session.setAttribute("list", list);

			return result;
		}

	}
}