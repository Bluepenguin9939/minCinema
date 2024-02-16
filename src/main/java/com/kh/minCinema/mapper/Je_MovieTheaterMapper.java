package com.kh.minCinema.mapper;


import java.util.List;

import com.kh.minCinema.domain.Je_InsertResSeatDTO;
import com.kh.minCinema.domain.Je_MovieDateInfoDTO;
import com.kh.minCinema.domain.Jo_ReservedHistoryDTO;




public interface Je_MovieTheaterMapper {

	public List<String> movieReservedSeats(Je_MovieDateInfoDTO je_MovieDateInfoDTO);
	
	public int insertReservedSeats(Je_InsertResSeatDTO je_InsertResSeatDTO);
	
	public int dupCheck(Je_InsertResSeatDTO je_InsertResSeatDTO);
	
//	예매 내역 가져오기 by Jo
	public List<Jo_ReservedHistoryDTO> selectReservedHistory(String mid);
	
//	예매 영화 이름 가져오가 by Jo
	public String selectMovieTitle(String mov_date_code);
}
