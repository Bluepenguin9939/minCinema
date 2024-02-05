package com.kh.minCinema.service;

import java.util.List;

import com.kh.minCinema.domain.Ham_CountDateVO;
import com.kh.minCinema.domain.Ham_OneononeVO;
import com.kh.minCinema.mapper.Ham_OneononeMapper;

public interface Ham_OneononeService {
	
	public List<Ham_OneononeVO> selectOne();
	
	public int insertInquiry(Ham_OneononeVO ham_OneononeVO);
	
	public Ham_OneononeVO selectGetOne(Ham_OneononeVO ham_OneononeVO);
	
	public int updateInquiry(Ham_OneononeVO ham_OneononeVO);
	
	public Ham_OneononeVO selectViewReply(Ham_OneononeVO ham_OneononeVO);
	
	public List<Ham_OneononeVO> selectGetReply(String sender);
	
	public List<Ham_CountDateVO> inquirySendCount();
	
	public List<Ham_CountDateVO> inquiryReplyCount();
	
	public List<Ham_OneononeVO> listOneonone(Ham_OneononeVO oneononeVO);
	
	public int replyUpdate(int rn);
	
}
