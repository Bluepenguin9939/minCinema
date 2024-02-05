package com.kh.minCinema.mapper;

import java.util.List;

import com.kh.minCinema.domain.Heo_MemberVO;
import com.kh.minCinema.domain.Jo_AttachVO;
import com.kh.minCinema.domain.Jo_MoviePosterDTO;

public interface Jo_AttachMapper {
	
	public int insertFile(Jo_AttachVO attachVO);
	
	public int insertMoviePoster(Jo_MoviePosterDTO posterDTO);
	
	public int insertMovieStillCut(Jo_AttachVO attachVO);
	
	public Heo_MemberVO selectFile(String mid);
	
	public List<Jo_AttachVO> selectMoviePoster();
	
	public List<Jo_AttachVO> selectSlideMoviePoster();
	
	public List<Jo_AttachVO> selectMovieImageToCode(String mov_code);
	
	public int checkProfileImage(String mid);
	
	public int deleteFile(String uuid);
	
	public Jo_AttachVO selectDeleteUuid(String mid);
	
}
