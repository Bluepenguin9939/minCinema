package com.kh.minCinema.mapper;

import java.util.List;

import com.kh.minCinema.domain.Ham_OneononeVO;

public interface Ham_OneononeMapper {

	public List<Ham_OneononeVO> selectOne();
	
	public int insertInquiry(Ham_OneononeVO ham_OneononeVO);
	
	public Ham_OneononeVO selectGetOne(Ham_OneononeVO ham_OneononeVO);
	
	public int updateInquiry(Ham_OneononeVO ham_OneononeVO);
	
	public Ham_OneononeVO selectViewReply(Ham_OneononeVO ham_OneononeVO);
	
	public List<Ham_OneononeVO> selectGetReply(String sender);
	
	public int inquiryCount();
}
