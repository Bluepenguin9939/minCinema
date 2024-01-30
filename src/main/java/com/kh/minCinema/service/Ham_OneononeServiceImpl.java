package com.kh.minCinema.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.minCinema.domain.Ham_OneononeVO;
import com.kh.minCinema.domain.Ham_TestVO;
import com.kh.minCinema.mapper.Ham_OneononeMapper;
import com.kh.minCinema.mapper.Ham_TestMapper;

@Service
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

}
