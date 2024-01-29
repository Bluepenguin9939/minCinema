package com.kh.minCinema.mapper;

import com.kh.minCinema.domain.Jo_HeartDTO;

public interface Jo_HeartMapper {
	
	public void insertHeart(Jo_HeartDTO heartDTO);
	
	public void deleteHeart(Jo_HeartDTO heartDTO);
	
	public String[] checkHeart(String mid);
}
