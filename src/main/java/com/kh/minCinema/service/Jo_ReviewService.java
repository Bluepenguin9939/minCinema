package com.kh.minCinema.service;

import java.util.List;

import com.kh.minCinema.domain.Jo_ReviewVO;

public interface Jo_ReviewService {
	
	public boolean writeReview(Jo_ReviewVO reviewVO);
	
	public List<Jo_ReviewVO> getReview();
}
