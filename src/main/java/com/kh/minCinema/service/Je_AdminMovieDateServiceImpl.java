package com.kh.minCinema.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.minCinema.domain.Je_MovieReservDTO;
import com.kh.minCinema.domain.Jo_MovieVO;
import com.kh.minCinema.mapper.Je_AdminMoiveDateMapper;
import com.kh.minCinema.mapper.Je_MovieDateMapper;
import com.kh.minCinema.mapper.Je_MovieLocMapper;
import com.kh.minCinema.mapper.Je_MovieTimeMapper;

import lombok.extern.log4j.Log4j;


@Log4j
@Service
public class Je_AdminMovieDateServiceImpl implements Je_AdminMovieDateService {
	
	@Autowired
	private Je_AdminMoiveDateMapper je_AdminMovieDateMapper;
	
	@Override
	public List<Jo_MovieVO> movieDataLists() {
		// TODO Auto-generated method stub
		List<Jo_MovieVO> list = je_AdminMovieDateMapper.movieLists();
		//log.info(">>>>>>>>>>>>>>>@list:"+list);
		
		return list;
	}
	
	

}
