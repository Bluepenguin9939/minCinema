package com.kh.minCinema.mapper;


import java.util.List;

import com.kh.minCinema.domain.Je_InsertResSeatDTO;
import com.kh.minCinema.domain.Je_MovieDateInfoDTO;




public interface Je_MovieTheaterMapper {

	public List<String> movieReservedSeats(Je_MovieDateInfoDTO je_MovieDateInfoDTO);
	
	public int insertReservedSeats(Je_InsertResSeatDTO je_InsertResSeatDTO);
	
	public int dupCheck(Je_InsertResSeatDTO je_InsertResSeatDTO);
	
}
