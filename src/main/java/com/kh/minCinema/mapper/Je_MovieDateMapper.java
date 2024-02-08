package com.kh.minCinema.mapper;

import java.util.List;

import com.kh.minCinema.domain.Je_MovieDateInfoDTO;
import com.kh.minCinema.domain.Je_ReservationInfoVO;


public interface Je_MovieDateMapper {
	
	public List<String> movieScreenDates(String movieCode);
	
	public List<Je_MovieDateInfoDTO> movieStartTimes(Je_MovieDateInfoDTO je_MovieDateInfoDTO);
	
	public List<Je_MovieDateInfoDTO> selectTitleAndCode();// by Je 추가
	
	public String movieDateCode(Je_ReservationInfoVO je_ReservationInfoVO);
}
