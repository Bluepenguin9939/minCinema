package com.kh.minCinema.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.minCinema.domain.Ham_CountDateVO;
import com.kh.minCinema.domain.Ham_OneononeVO;
import com.kh.minCinema.mapper.Ham_OneononeMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class Ham_OneononeServiceImpl implements Ham_OneononeService {

	@Autowired
	private Ham_OneononeMapper ham_OneononeMapper;
	
	@Override
	public List<Ham_OneononeVO> selectOne() {
		List<Ham_OneononeVO> list = ham_OneononeMapper.selectOne();
		
		return list;
	}

	@Override
	public int insertInquiry(Ham_OneononeVO ham_OneononeVO) {
		return ham_OneononeMapper.insertInquiry(ham_OneononeVO);
	}

	@Override
	public Ham_OneononeVO selectGetOne(Ham_OneononeVO vo) {
		Ham_OneononeVO ham_OneononeVO = ham_OneononeMapper.selectGetOne(vo);
		return ham_OneononeVO;
	}

	@Override
	public int updateInquiry(Ham_OneononeVO ham_OneononeVO) {
		return ham_OneononeMapper.updateInquiry(ham_OneononeVO);
	}

	@Override
	public Ham_OneononeVO selectViewReply(Ham_OneononeVO ham_OneononeVO) {
		Ham_OneononeVO vo = ham_OneononeMapper.selectViewReply(ham_OneononeVO);
		return vo;
	}

	@Override
	public List<Ham_OneononeVO> selectGetReply(String sender) {
		List<Ham_OneononeVO> list = ham_OneononeMapper.selectGetReply(sender);
		return list;
	}

	@Override
	public List<Ham_CountDateVO> inquirySendCount() {
		List<Ham_CountDateVO> list = ham_OneononeMapper.inquirySendCount();
		
		return list;
	}

	@Override
	public List<Ham_CountDateVO> inquiryReplyCount() {
		List<Ham_CountDateVO> list = ham_OneononeMapper.inquiryReplyCount();
		return list;
	}


	@Override
	public List<Ham_OneononeVO> listOneonone(Ham_OneononeVO vo) {
		log.info("테스트브이오:"+vo);
		List<Ham_OneononeVO> list = ham_OneononeMapper.listOneonone(vo);
		return list;
	}

	@Override
	public int replyUpdate(int rn) {
		
		return ham_OneononeMapper.replyUpdate(rn);
	}



}
