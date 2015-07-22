package com.mytest.DAO;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mytest.DTO.MemberDTO;
import com.mytest.controller.HomeController;

//Service 클래스를 Repository로 등록함으로서 빈(bean) 클래스로 사용하능하게한다. 

@Repository
public class MemberDAOService implements MemberDAO {

	// Autowired를 사용하여 sqlSession을 사용할수 있다.
	private static final Logger logger = LoggerFactory.getLogger(MemberDAOService.class);
	@Autowired
	private SqlSession sqlSession;

	@Override
	public ArrayList<MemberDTO> getMemberName(String name) {

		ArrayList<MemberDTO> result = new ArrayList<MemberDTO>();

		// sqlSession을 통하여 매핑한다.
		logger.info("MemberDAOService.java");
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);

		// getMember()의 메소드명과 mapper.mxl과 id는 동일해야한다.

		result = memberMapper.getMemberName(name);

		return result;

	}

	@Override
	public String getMemberEmail(String email) {
		//db에서 email로 체크하는부분
		ArrayList<MemberDTO> result = new ArrayList<MemberDTO>();
		// sqlSession을 통하여 매핑한다.
		logger.info("MemberDAOService.java");
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);

		// getMember()의 메소드명과 mapper.mxl과 id는 동일해야한다.

		result = memberMapper.getMemberEmail(email);
		
		if (result.size() == 0)
			return "";
		else
			return result.get(0).get_email();

	}

	@Override
	public void insertMember(MemberDTO member) {
		logger.info("insertMember");
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);

		memberMapper.insertMember(member);

	}

	// 아래부분은 코딩하다 말았음

	@Override
	public void updateMember(String name) {

	}

	@Override
	public void deleteMember(String name) {

		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);

		memberMapper.deleteMember(name);

	}

}