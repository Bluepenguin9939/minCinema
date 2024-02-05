package com.kh.minCinema.service;

import java.util.List;

import com.kh.minCinema.domain.Je_MovieDateInfoDTO;
import com.kh.minCinema.domain.Je_ReservationInfoVO;

public interface Je_MovieDateService {

	public List<String> movieScreenDates(String movieCode);
	
	public List<Je_MovieDateInfoDTO> movieStartTimes(Je_MovieDateInfoDTO je_MovieDateInfoDTO);
	
	public List<String> movieReservedSeats(Je_MovieDateInfoDTO je_MovieReservDTO);

	public int insertReservedSeats(Je_ReservationInfoVO je_ReservationInfoVO);
	
}
