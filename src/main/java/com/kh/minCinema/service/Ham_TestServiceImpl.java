package com.kh.minCinema.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.minCinema.domain.Ham_TestVO;
import com.kh.minCinema.mapper.Ham_TestMapper;

@Service
public class Ham_TestServiceImpl implements Ham_TestService {

	@Autowired
	private Ham_TestMapper testMapper;
	


	@Override
	public int TestInsert(Ham_TestVO testVO) {
		return testMapper.insertTest(testVO);
	}

	@Override
	public List<Ham_TestVO> testMemberList(Ham_TestVO testVO) {
		List<Ham_TestVO> list  = testMapper.testMemberList(testVO);
		return list;
	}

	@Override
	public int testMemberDelete(String tmid) {
		 
		return testMapper.testMemberDelete(tmid);
	}
	


}
