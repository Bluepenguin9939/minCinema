package com.kh.minCinema.service;

import java.util.List;

import com.kh.minCinema.domain.Jo_EventRewardVO;

public interface Jo_EventRewardService {

	public List<Integer> checkReceive(Jo_EventRewardVO eventRewardVO);
	
	public int getReceive(Jo_EventRewardVO eventRewardVO);
}
