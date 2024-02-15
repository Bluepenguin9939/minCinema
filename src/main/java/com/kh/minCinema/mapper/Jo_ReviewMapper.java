package com.kh.minCinema.mapper;

import java.util.List;

import com.kh.minCinema.domain.Jo_ReviewVO;

public interface Jo_ReviewMapper {
	
	public int insertReview(Jo_ReviewVO reviewVO);
	
	public List<Jo_ReviewVO> selectReview(String mov_code);
	
	public int updateReview(Jo_ReviewVO reviewVO);
	
	public int deleteReview(int rno);
}
