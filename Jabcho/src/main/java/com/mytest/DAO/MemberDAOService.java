package com.mytest.DAO;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

//Service Ŭ������ Repository�� ��������μ� ��(bean) Ŭ������ ����ϴ��ϰ��Ѵ�. 

@Repository
public class MemberDAOService implements MemberDAO {

	// Autowired�� ����Ͽ� sqlSession�� ����Ҽ� �ִ�.

	@Autowired
	private SqlSession sqlSession;

	@Override
	public ArrayList<Member> getMember() {

		ArrayList<Member> result = new ArrayList<Member>();

		// sqlSession�� ���Ͽ� �����Ѵ�.
		System.out.println("MemberDAOService.java");
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);

		// getMember()�� �޼ҵ��� mapper.mxl�� id�� �����ؾ��Ѵ�.

		result = memberMapper.getMember();

		return result;

	}

	@Override
	public void insertMember(Member member) {
		System.out.println("insertMember");
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