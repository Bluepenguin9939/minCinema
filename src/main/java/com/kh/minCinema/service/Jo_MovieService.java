package com.kh.minCinema.service;

import java.util.List;

import com.kh.minCinema.domain.Jo_MovieVO;

public interface Jo_MovieService {
	
	public boolean addMovie(Jo_MovieVO movieVO);
	
	public List<Jo_MovieVO> getAll();
	
	public Jo_MovieVO getMovieByCode(String mov_code);
	
	public List<Jo_MovieVO> getInterestToHeart(String mid);
}
