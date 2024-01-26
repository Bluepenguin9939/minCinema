package com.kh.minCinema.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.minCinema.domain.Ham_TestVO;
import com.kh.minCinema.mapper.Ham_TestMapper;

@Service
public class Ham_TestServiceImpl implements Ham_TestService {

	@Autowired
	private Ham_TestMapper testMapper;

	@Override
	public void TestInsert(Ham_TestVO testVO) {
		testMapper.insertTest(testVO);
	}

}
