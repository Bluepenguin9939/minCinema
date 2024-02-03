package com.kh.minCinema.service;

import java.util.List;
import java.util.Map;

import com.kh.minCinema.domain.Je_MovieReservDTO;
import com.kh.minCinema.domain.Jo_MovieVO;
import com.kh.minCinema.domain.Jo_SearchDTO;

public interface Jo_MovieService {
	
	public boolean addMovie(Jo_MovieVO movieVO);
	
	public List<Jo_MovieVO> getAll(Jo_SearchDTO searchDTO);
	
	public Map<String, Object> getMovieByCode(String mov_code);
	
	public List<Jo_MovieVO> getInterestToHeart(String mid);
	
	public List<Jo_MovieVO> getSlideMovie();
	
	public List<Je_MovieReservDTO> getMovieTitleAndCode(); // by Je 추가
}
