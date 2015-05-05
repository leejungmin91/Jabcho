package com.mytest.DAO;

import java.util.ArrayList;

public interface MemberMapper {

	ArrayList<Member> getMember();

	void insertMember(Member member);
		
	void updateMember(String name);

	void deleteMember(String name);

}
