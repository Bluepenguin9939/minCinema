package com.kh.minCinema.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.minCinema.domain.Jo_MovieVO;
import com.kh.minCinema.mapper.Jo_AttachMapper;
import com.kh.minCinema.mapper.Jo_MovieMapper;

@Service
public class Jo_MovieServiceImpl implements Jo_MovieService {
	
	@Autowired
	private Jo_MovieMapper movieMapper;
	
	@Autowired
	private Jo_AttachMapper attachMapper;

	@Override
	public boolean addMovie(Jo_MovieVO movieVO) {
		int count = movieMapper.insertMovie(movieVO);
		int count2 = attachMapper.insertMoviePoster(movieVO.getAttachVO());
		if (count + count2 == 2) {
			return true;
		}
		return false;
	}

	@Override
	public List<Jo_MovieVO> getAll() {
		List<Jo_MovieVO> movieVO = movieMapper.selectAll();
		return movieVO;
	}

	@Override
	public Jo_MovieVO getMovieByCode(String mov_code) {
		Jo_MovieVO movieVO = movieMapper.selectMovieByCode(mov_code);
		return movieVO;
	}

	@Override
	public List<Jo_MovieVO> getInterestToHeart(String mid) {
		List<Jo_MovieVO> movieList = movieMapper.selectInterestToHeart(mid);
		return movieList;
	}
	
}
