package com.kh.minCinema.mapper;

import java.util.List;

import com.kh.minCinema.domain.Jo_EventDTO;

public interface Jo_EventMapper {
	
	public String selectByMid(Jo_EventDTO eventDTO);
	
	public List<String> changeImg(String mid);
	
	public int clickToAttendance(String mid);
}
