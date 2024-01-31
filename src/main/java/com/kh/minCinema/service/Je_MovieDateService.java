package com.kh.minCinema.service;

import java.util.List;

import com.kh.minCinema.domain.Je_MovieReservDTO;

public interface Je_MovieDateService {

	public List<String> movieScreenDates(String movieCode);
	
	public String selectMovieDateCode(Je_MovieReservDTO je_MovieReservDTO);
	
	public List<Je_MovieReservDTO> movieStartTimes(String movieDateCode);
}
