package com.mytest.service;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.mytest.DAO.MemberDAOService;
import com.mytest.DTO.MemberDTO;

@Service
public class MemberService implements MemberServiceImpl{
	@Autowired
	private MemberDAOService memberDAOService;
	private static final Logger logger = LoggerFactory
			.getLogger(MemberService.class);

	public void insert(MemberDTO m) {
		// HttpServletRequest를 이용하여 main.jsp로부터 값을 가져온다 getParameter로는 id값을 가져옴.
		memberDAOService.insertMember(m);
		logger.info("insert complet");
		// 아래부분은 select값을 result.jsp파일에 보여주기 위해 또사용.
		ModelAndView result = new ModelAndView();
		List<MemberDTO> memberList = memberDAOService.getMemberName(m.get_name());
		result.addObject("result", memberList);
		result.setViewName("main");
	}
	
	public List<MemberDTO> getMember(MemberDTO m) {
		// HttpServletRequest를 이용하여 main.jsp로부터 값을 가져온다 getParameter로는 id값을 가져옴.
		logger.info("get member");
		// 아래부분은 select값을 result.jsp파일에 보여주기 위해 또사용.
		ModelAndView result = new ModelAndView();
		List<MemberDTO> memberList = memberDAOService.getMemberName(m.get_name());
		result.addObject("result", memberList);
		result.setViewName("main");
		return memberList;
	}
}
