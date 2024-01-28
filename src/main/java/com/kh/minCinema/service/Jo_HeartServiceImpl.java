package com.kh.minCinema.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.minCinema.domain.Jo_HeartDTO;
import com.kh.minCinema.mapper.Jo_HeartMapper;

@Service
public class Jo_HeartServiceImpl implements Jo_HeartService {

	@Autowired
	private Jo_HeartMapper heartMapper;
	
	@Override
	public void addHeart(Jo_HeartDTO heartDTO) {
		heartMapper.insertHeart(heartDTO);
	}

	@Override
	public void removeHeart(Jo_HeartDTO heartDTO) {
		heartMapper.deleteHeart(heartDTO);
	}

	@Override
	public String[] checkHeart(String mid) {
		String[] heartList = heartMapper.checkHeart(mid);
		return heartList;
	}

}
