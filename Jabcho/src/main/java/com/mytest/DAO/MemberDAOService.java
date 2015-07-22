package com.mytest.DAO;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mytest.DTO.MemberDTO;
import com.mytest.controller.HomeController;

//Service Ŭ������ Repository�� ��������μ� ��(bean) Ŭ������ ����ϴ��ϰ��Ѵ�. 

@Repository
public class MemberDAOService implements MemberDAO {

	// Autowired�� ����Ͽ� sqlSession�� ����Ҽ� �ִ�.
	private static final Logger logger = LoggerFactory.getLogger(MemberDAOService.class);
	@Autowired
	private SqlSession sqlSession;

	@Override
	public ArrayList<MemberDTO> getMemberName(String name) {

		ArrayList<MemberDTO> result = new ArrayList<MemberDTO>();

		// sqlSession�� ���Ͽ� �����Ѵ�.
		logger.info("MemberDAOService.java");
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);

		// getMember()�� �޼ҵ��� mapper.mxl�� id�� �����ؾ��Ѵ�.

		result = memberMapper.getMemberName(name);

		return result;

	}

	@Override
	public String getMemberEmail(String email) {
		//db���� email�� üũ�ϴºκ�
		ArrayList<MemberDTO> result = new ArrayList<MemberDTO>();
		// sqlSession�� ���Ͽ� �����Ѵ�.
		logger.info("MemberDAOService.java");
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);

		// getMember()�� �޼ҵ��� mapper.mxl�� id�� �����ؾ��Ѵ�.

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

	// �Ʒ��κ��� �ڵ��ϴ� ������

	@Override
	public void updateMember(String name) {

	}

	@Override
	public void deleteMember(String name) {

		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);

		memberMapper.deleteMember(name);

	}

}