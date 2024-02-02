package com.kh.minCinema.mapper;

import com.kh.minCinema.domain.Jo_EventRewardVO;

public interface Jo_EventRewardMapper {
	
	public int checkReceive(Jo_EventRewardVO eventRewardVO);
	
	public int insertReceive(Jo_EventRewardVO eventRewardVO);
}
