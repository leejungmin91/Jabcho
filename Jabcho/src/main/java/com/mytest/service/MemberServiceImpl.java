package com.mytest.service;

import java.util.ArrayList;
import java.util.List;
import com.mytest.DTO.MemberDTO;

public interface MemberServiceImpl {
	void insert(MemberDTO m);

	List<MemberDTO> getMember(MemberDTO m);
}
