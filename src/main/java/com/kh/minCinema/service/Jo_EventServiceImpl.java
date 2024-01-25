package com.kh.minCinema.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.minCinema.domain.Jo_EventDTO;
import com.kh.minCinema.mapper.Jo_EventMapper;

@Service
public class Jo_EventServiceImpl implements Jo_EventService {
	
	@Autowired
	private Jo_EventMapper eventMapper;

	@Override
	public Map<String, Object> checkAttendance(Jo_EventDTO eventDTO) {
		String checkAttendance = eventMapper.selectByMid(eventDTO);
		List<String> attendanceList = eventMapper.changeImg(eventDTO.getMid());
		System.out.println("checkAttendance : " + checkAttendance);
		System.out.println("attendanceList : " + attendanceList);
		Map<String, Object> map = new HashMap<>();
		map.put("checkAttendance", checkAttendance);
		map.put("attendanceList", attendanceList);
		return map;
	}

	@Override
	public boolean clickToAttendance(String mid) {
		int count = eventMapper.clickToAttendance(mid);
		if (count == 1) {
			return true;
		}
		return false;
	}
}
