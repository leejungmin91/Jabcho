package com.mytest.DAO;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

//Service 클래스를 Repository로 등록함으로서 빈(bean) 클래스로 사용하능하게한다. 

@Repository
public class MemberDAOService implements MemberDAO {

	// Autowired를 사용하여 sqlSession을 사용할수 있다.

	@Autowired
	private SqlSession sqlSession;

	@Override
	public ArrayList<Member> getMemberName(String name) {

		ArrayList<Member> result = new ArrayList<Member>();

		// sqlSession을 통하여 매핑한다.
		System.out.println("MemberDAOService.java");
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);

		// getMember()의 메소드명과 mapper.mxl과 id는 동일해야한다.

		result = memberMapper.getMemberName(name);

		return result;

	}

	@Override
	public String getMemberEmail(String email) {
		//db에서 email로 체크하는부분
		ArrayList<Member> result = new ArrayList<Member>();
		// sqlSession을 통하여 매핑한다.
		System.out.println("MemberDAOService.java");
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);

		// getMember()의 메소드명과 mapper.mxl과 id는 동일해야한다.

		result = memberMapper.getMemberEmail(email);
		
		if (result.size() == 0)
			return "";
		else
			return result.get(0).get_email();

	}

	@Override
	public void insertMember(Member member) {
		System.out.println("insertMember");
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