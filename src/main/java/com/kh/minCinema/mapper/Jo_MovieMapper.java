package com.kh.minCinema.mapper;

import java.util.List;

import com.kh.minCinema.domain.Je_MovieReservDTO;
import com.kh.minCinema.domain.Jo_MovieVO;

public interface Jo_MovieMapper {
	
	public int insertMovie(Jo_MovieVO movieVO);
	
	public List<Jo_MovieVO> selectAll();
	
	public Jo_MovieVO selectMovieByCode(String mov_code);
	
	public List<Jo_MovieVO> selectInterestToHeart(String mid);
	
	public List<Je_MovieReservDTO> selectTitleAndCode();// by Je 추가
}
