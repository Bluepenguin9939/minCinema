package com.kh.minCinema.service;

import com.kh.minCinema.domain.Jo_HeartDTO;

public interface Jo_HeartService {
	
	public void addHeart(Jo_HeartDTO heartDTO);
	
	public void removeHeart(Jo_HeartDTO heartDTO);
	
	public String[] checkHeart(String mid);
}
