package com.kh.minCinema.mapper;

import java.util.List;

import com.kh.minCinema.domain.Je_MovieReservDTO;


public interface Je_MovieDateMapper {
	
	public List<String> movieScreenDates(String movieCode);
	
	public String selectMovieDateCode(Je_MovieReservDTO je_MovieReservDTO);
	
}
