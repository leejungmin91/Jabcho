package com.mytest.DAO;

import java.util.ArrayList;

import com.mytest.DTO.MemberDTO;

public interface MemberDAO {
	public ArrayList<MemberDTO> getMemberName(String name);
	public String getMemberEmail(String email);

	public void insertMember(MemberDTO member);

	public void updateMember(String name);

	public void deleteMember(String name);
}