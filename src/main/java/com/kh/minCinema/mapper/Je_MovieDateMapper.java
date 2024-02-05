package com.kh.minCinema.mapper;

import java.util.List;

import com.kh.minCinema.domain.Je_MovieDateInfoDTO;


public interface Je_MovieDateMapper {
	
	public List<String> movieScreenDates(String movieCode);
	
	public List<Je_MovieDateInfoDTO> movieStartTimes(Je_MovieDateInfoDTO je_MovieDateInfoDTO);
	

}
