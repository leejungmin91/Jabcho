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
		// HttpServletRequest�� �̿��Ͽ� main.jsp�κ��� ���� �����´� getParameter�δ� id���� ������.
		memberDAOService.insertMember(m);
		logger.info("insert complet");
		// �Ʒ��κ��� select���� result.jsp���Ͽ� �����ֱ� ���� �ǻ��.
		ModelAndView result = new ModelAndView();
		List<MemberDTO> memberList = memberDAOService.getMemberName(m.get_name());
		result.addObject("result", memberList);
		result.setViewName("main");
	}
	
	public List<MemberDTO> getMember(MemberDTO m) {
		// HttpServletRequest�� �̿��Ͽ� main.jsp�κ��� ���� �����´� getParameter�δ� id���� ������.
		logger.info("get member");
		// �Ʒ��κ��� select���� result.jsp���Ͽ� �����ֱ� ���� �ǻ��.
		ModelAndView result = new ModelAndView();
		List<MemberDTO> memberList = memberDAOService.getMemberName(m.get_name());
		result.addObject("result", memberList);
		result.setViewName("main");
		return memberList;
	}
}
