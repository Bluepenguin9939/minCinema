package com.kh.minCinema.service;

import java.util.Map;

import com.kh.minCinema.domain.Jo_EventDTO;

public interface Jo_EventService {
	
	public Map<String, Object> checkAttendance(Jo_EventDTO eventDTO);
	
	public boolean clickToAttendance(String mid);
}
