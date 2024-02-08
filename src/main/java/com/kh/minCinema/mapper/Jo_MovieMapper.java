package com.kh.minCinema.mapper;

import java.util.List;

import com.kh.minCinema.domain.Ham_MovieCountDTO;
import com.kh.minCinema.domain.Je_MovieDateInfoDTO;
import com.kh.minCinema.domain.Jo_MovieVO;
import com.kh.minCinema.domain.Jo_SearchDTO;

public interface Jo_MovieMapper {
	
	public int insertMovie(Jo_MovieVO movieVO);
	
	public List<Jo_MovieVO> selectAll(String mov_genre);
	
	public List<Jo_MovieVO> selectMovieSearch(Jo_SearchDTO searchDTO);
	
	public Jo_MovieVO selectMovieByCode(String mov_code);
	
	public List<Jo_MovieVO> selectInterestToHeart(String mid);
	
	public List<Jo_MovieVO> selectSlideMovie();
		
	public List<Ham_MovieCountDTO> selectMovieCount();// 관리자 차트 추가용 h
	
	public void movieDelete(String mov_code);//영화 삭제

}
