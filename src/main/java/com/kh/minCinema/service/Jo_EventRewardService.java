package com.kh.minCinema.service;

import com.kh.minCinema.domain.Jo_EventRewardVO;

public interface Jo_EventRewardService {

	public boolean checkReceive(Jo_EventRewardVO eventRewardVO);
	
	public int getReceive(Jo_EventRewardVO eventRewardVO);
}
