package com.kh.minCinema.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.minCinema.mapper.Je_MovieDateMapper;


@Service
public class Je_MovieDateServiceImpl implements Je_MovieDateService {
	
	@Autowired
	private Je_MovieDateMapper je_MovieDateMapper;
	
	@Override
	public List<String> movieScreenDates(String movieCode) {
		
		List<String> list = je_MovieDateMapper.movieScreenDates(movieCode);
		
		return list;
	}

	


}
