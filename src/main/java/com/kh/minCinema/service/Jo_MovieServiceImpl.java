package com.kh.minCinema.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.kh.minCinema.domain.Je_MovieReservDTO;

import com.kh.minCinema.domain.Jo_AttachVO;

import com.kh.minCinema.domain.Jo_MovieVO;
import com.kh.minCinema.domain.Jo_SearchDTO;
import com.kh.minCinema.mapper.Jo_AttachMapper;
import com.kh.minCinema.mapper.Jo_MovieMapper;

import lombok.extern.log4j.Log4j;


@Service
@Log4j
public class Jo_MovieServiceImpl implements Jo_MovieService {
	
	@Autowired
	private Jo_MovieMapper movieMapper;
	
	@Autowired
	private Jo_AttachMapper attachMapper;

	@Override
	@Transactional
	public boolean addMovie(Jo_MovieVO movieVO) {
		int count = movieMapper.insertMovie(movieVO);
		int count2 = attachMapper.insertMoviePoster(movieVO.getPosterDTO());
		List<Jo_AttachVO> attachList = movieVO.getList();
		int count3 = 0;
		for (Jo_AttachVO attachVO : attachList) {
			count3 = attachMapper.insertMovieStillCut(attachVO);
		}
		log.info("count : " + count);
		log.info("count2 : " + count2);
		log.info("count3 : " + count3);
		if (count + count2 + count3 == 3) {
			return true;
		}
		return false;
	}

	@Override
	public List<Jo_MovieVO> getAll(Jo_SearchDTO searchDTO) {
		List<Jo_MovieVO> movieList = new ArrayList<>();
		if (searchDTO.getKeyword() == null || searchDTO.getKeyword() == "") {
			movieList = movieMapper.selectAll(searchDTO.getMov_genre());
		} else {
			movieList = movieMapper.selectMovieSearch(searchDTO);
		}
		return movieList;
	}

	@Override
	public Map<String, Object> getMovieByCode(String mov_code) {
		Map<String, Object> map = new HashMap<>();
		Jo_MovieVO movieVO = movieMapper.selectMovieByCode(mov_code);
		List<Jo_AttachVO> attachList = attachMapper.selectMovieImageToCode(mov_code);
		map.put("movieVO", movieVO);
		map.put("attachList", attachList);
		return map;
	}

	@Override
	public List<Jo_MovieVO> getInterestToHeart(String mid) {
		List<Jo_MovieVO> movieList = movieMapper.selectInterestToHeart(mid);
		return movieList;
	}

	@Override
	public List<Jo_MovieVO> getSlideMovie() {
		List<Jo_MovieVO> movieList = movieMapper.selectSlideMovie();
		return movieList;
	}
	
	@Override//by Je 추가
	public List<Je_MovieReservDTO> getMovieTitleAndCode() {
		List<Je_MovieReservDTO> list = movieMapper.selectTitleAndCode();
		return list;
	}

}
