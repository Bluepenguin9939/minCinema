package com.kh.minCinema.service;

import java.util.List;

import com.kh.minCinema.domain.Ham_OneononeVO;

public interface Ham_OneononeService {
	
	public List<Ham_OneononeVO> selectOne();
	
	public int insertInquiry(Ham_OneononeVO ham_OneononeVO);
	
	public Ham_OneononeVO selectGetOne(Ham_OneononeVO ham_OneononeVO);
}
