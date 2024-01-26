package com.kh.minCinema.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.minCinema.domain.Jo_MovieVO;
import com.kh.minCinema.mapper.Jo_MovieMapper;

@Service
public class Jo_MovieServiceImpl implements Jo_MovieService {
	
	@Autowired
	private Jo_MovieMapper movieMapper;

	@Override
	public boolean addMovie(Jo_MovieVO movieVO) {
		int count = movieMapper.insertMovie(movieVO);
		if (count == 1) {
			return true;
		}
		return false;
	}

	@Override
	public List<Jo_MovieVO> getAll() {
		List<Jo_MovieVO> movieVO = movieMapper.selectAll();
		return movieVO;
	}
	
}
