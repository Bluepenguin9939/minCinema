package com.kh.minCinema.mapper;

import java.util.List;

import com.kh.minCinema.domain.Ham_TestVO;

public interface Ham_TestMapper {

	public int insertTest(Ham_TestVO testVO);
	
	public List<Ham_TestVO> testMemberList(Ham_TestVO vo);
	
	public int testMemberDelete(String tmid);
}
