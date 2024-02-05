package com.kh.minCinema.service;

import java.util.List;

import com.kh.minCinema.domain.Je_MovieDateInfoDTO;
import com.kh.minCinema.domain.Jo_MovieVO;

public interface Je_AdminMovieDateService {

	public List<Jo_MovieVO> movieDataLists();
	
	public List<Je_MovieDateInfoDTO> movieDates(String mov_code);
	
	public int addDate(Je_MovieDateInfoDTO je_MovieDateInfoDTO);
	
	public String selectDateCode(Je_MovieDateInfoDTO je_MovieDateInfoDTO);
	
	public int editDate(Je_MovieDateInfoDTO je_MovieDateInfoDTO);
	
	public int remove(String mov_date_code);

}