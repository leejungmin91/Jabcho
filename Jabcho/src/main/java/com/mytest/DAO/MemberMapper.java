package com.mytest.DAO;

import java.util.ArrayList;

import com.mytest.DTO.MemberDTO;

public interface MemberMapper {

	ArrayList<MemberDTO> getMemberName(String name);
	ArrayList<MemberDTO> getMemberEmail(String email);

	void insertMember(MemberDTO member);
		
	void updateMember(String name);

	void deleteMember(String name);

}
