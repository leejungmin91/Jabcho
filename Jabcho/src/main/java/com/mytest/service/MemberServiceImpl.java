package com.mytest.service;

import java.util.ArrayList;
import java.util.List;

import com.mytest.DAO.Member;

public interface MemberServiceImpl {
	void insert(Member m);

	List<Member> getMember();
}
