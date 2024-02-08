package com.kh.minCinema.mapper;

import java.util.List;

import com.kh.minCinema.domain.Je_MovieDateInfoDTO;
import com.kh.minCinema.domain.Jo_MovieVO;



public interface Je_AdminMoiveDateMapper {
	
	public List<Jo_MovieVO> movieLists();
	
	public List<Je_MovieDateInfoDTO> movieDates(String mov_code);
	
	public int dupCheck(Je_MovieDateInfoDTO je_MovieDateInfoDTO);
	
	public int insertDate(Je_MovieDateInfoDTO je_MovieDateInfoDTO);
	
	public String selectDateCode(Je_MovieDateInfoDTO je_MovieDateInfoDTO);
	
	public int updateDate(Je_MovieDateInfoDTO je_MovieDateInfoDTO);
	
	public int updateRes(Je_MovieDateInfoDTO je_MovieDateInfoDTO);
	
	public int deleteDate(String mov_date_code);
}
