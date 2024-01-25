package com.kh.minCinema.mapper;

import com.kh.minCinema.domain.Jo_EventDTO;

public interface Jo_EventMapper {
	
	public String selectByMid(Jo_EventDTO eventDTO);
	
	public String changeImg(String mid);
}
