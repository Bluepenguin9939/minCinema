package com.kh.minCinema.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.minCinema.domain.Je_MovieDateInfoDTO;
import com.kh.minCinema.domain.Jo_MovieVO;
import com.kh.minCinema.mapper.Je_AdminMoiveDateMapper;

import lombok.extern.log4j.Log4j;


@Log4j
@Service
public class Je_AdminMovieDateServiceImpl implements Je_AdminMovieDateService {
	
	@Autowired
	private Je_AdminMoiveDateMapper je_AdminMovieDateMapper;
	
	@Override
	public List<Jo_MovieVO> movieDataLists() {
		List<Jo_MovieVO> list = je_AdminMovieDateMapper.movieLists();
		//log.info(">>>>>>>>>>>>>>>@list:"+list);
		
		return list;
	}
	
	@Override
	public List<Je_MovieDateInfoDTO> movieDates(String mov_code) {
		List<Je_MovieDateInfoDTO> list = je_AdminMovieDateMapper.movieDates(mov_code);
		
		return list;
	}
	
	@Override
	public int dupCheck(Je_MovieDateInfoDTO je_MovieDateInfoDTO) {
		int count = je_AdminMovieDateMapper.dupCheck(je_MovieDateInfoDTO);		
		return count;
	}

	@Override
	public int addDate(Je_MovieDateInfoDTO je_MovieDateInfoDTO) {
		
		int count = je_AdminMovieDateMapper.insertDate(je_MovieDateInfoDTO);
		
		return count;
	}
	
	@Override
	public String selectDateCode(Je_MovieDateInfoDTO je_MovieDateInfoDTO) {
		
		String dateCode = je_AdminMovieDateMapper.selectDateCode(je_MovieDateInfoDTO);
		
		return dateCode;
	}

	@Override
	public int editDate(Je_MovieDateInfoDTO je_MovieDateInfoDTO) {
		int count = je_AdminMovieDateMapper.updateDate(je_MovieDateInfoDTO);
		
		return count;
	}

	@Override
	public int remove(String mov_date_code) {
		int count = je_AdminMovieDateMapper.deleteDate(mov_date_code);
		return count;
	}

	
	

}
