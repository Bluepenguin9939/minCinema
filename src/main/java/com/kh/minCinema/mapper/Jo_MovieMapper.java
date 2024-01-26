package com.kh.minCinema.mapper;

import java.util.List;

import com.kh.minCinema.domain.Jo_MovieVO;

public interface Jo_MovieMapper {
	
	public int insertMovie(Jo_MovieVO movieVO);
	
	public List<Jo_MovieVO> selectAll();
}
