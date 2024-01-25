package com.kh.minCinema.service;

import java.util.HashMap;

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
	public Map<String, String> checkAttendance(Jo_EventDTO eventDTO) {
		String result = eventMapper.selectByMid(eventDTO);
		String result2 = eventMapper.changeImg(eventDTO.getMid());
		System.out.println("result : " + result);
		System.out.println("result2 : " + result2);
		Map<String, String> map = new HashMap<String, String>();
		map.put("result", result);
		map.put("result2", result2);
		return map;
	}

//	@Override
//	public String changeImg(String mid) {
//		return result;
//	}
}
