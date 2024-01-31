package com.kh.minCinema.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.minCinema.domain.Je_MovieReservDTO;
import com.kh.minCinema.mapper.Je_MovieDateMapper;
import com.kh.minCinema.mapper.Je_MovieTimeMapper;

import lombok.extern.log4j.Log4j;


@Log4j
@Service
public class Je_MovieDateServiceImpl implements Je_MovieDateService {
	
	@Autowired
	private Je_MovieDateMapper je_MovieDateMapper;
	
	@Autowired
	private Je_MovieTimeMapper je_MovieTimeMapper;
	
	@Override
	public List<String> movieScreenDates(String movieCode) {
		
		List<String> list = je_MovieDateMapper.movieScreenDates(movieCode);
		
		return list;
	}

	@Override
	public String selectMovieDateCode(Je_MovieReservDTO je_MovieReservDTO) {
		String mov_date_code = je_MovieDateMapper.selectMovieDateCode(je_MovieReservDTO);
		
		return mov_date_code;
	}

	@Override
	public List<Je_MovieReservDTO> movieStartTimes(String movieDateCode) {

		List<Je_MovieReservDTO> list = je_MovieTimeMapper.movieStartTimes(movieDateCode);
		
		return list;
	}

	


}
