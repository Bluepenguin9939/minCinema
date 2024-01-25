package com.kh.minCinema.service;

import java.util.Map;

import com.kh.minCinema.domain.Jo_EventDTO;

public interface Jo_EventService {
	
	public Map<String, String> checkAttendance(Jo_EventDTO eventDTO);
	
//	public String changeImg(String mid);
}
