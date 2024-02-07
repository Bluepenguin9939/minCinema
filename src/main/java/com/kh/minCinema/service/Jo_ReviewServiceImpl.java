package com.kh.minCinema.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.minCinema.domain.Jo_ReviewVO;
import com.kh.minCinema.mapper.Jo_ReviewMapper;

@Service
public class Jo_ReviewServiceImpl implements Jo_ReviewService {

	@Autowired
	private Jo_ReviewMapper reviewMapper;
	
	@Override
	public boolean writeReview(Jo_ReviewVO reviewVO) {
		int count = reviewMapper.insertReview(reviewVO);
		return (count == 1) ? true : false;
	}

	@Override
	public List<Jo_ReviewVO> getReview(String mov_code) {
		List<Jo_ReviewVO> reviewList = reviewMapper.selectReview(mov_code);
		return reviewList;
	}

}
