package com.mytest.DAO;

import java.util.ArrayList;

public interface MemberDAO {
	public ArrayList<Member> getMember();

	public void insertMember(Member member);

	public void updateMember(String name);

	public void deleteMember(String name);
}