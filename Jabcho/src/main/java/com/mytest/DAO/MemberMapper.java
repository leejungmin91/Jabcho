package com.mytest.DAO;

import java.util.ArrayList;

public interface MemberMapper {

	ArrayList<Member> getMemberName(String name);
	ArrayList<Member> getMemberEmail(String email);

	void insertMember(Member member);
		
	void updateMember(String name);

	void deleteMember(String name);

}
