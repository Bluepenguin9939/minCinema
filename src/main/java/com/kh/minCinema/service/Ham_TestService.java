package com.kh.minCinema.service;

import java.util.List;

import com.kh.minCinema.domain.Ham_TestVO;

public interface Ham_TestService {
	
	public int TestInsert(Ham_TestVO testVO);
	
	public List<Ham_TestVO> testMemberList(Ham_TestVO testVO);
	
	public int testMemberDelete(String tmid);
}
