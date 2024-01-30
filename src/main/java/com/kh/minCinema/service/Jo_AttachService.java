package com.kh.minCinema.service;

import java.util.Map;

import com.kh.minCinema.domain.Heo_MemberVO;
import com.kh.minCinema.domain.Jo_AttachVO;

public interface Jo_AttachService {
	
	public boolean addFile(Jo_AttachVO attachVO);
	
	public Heo_MemberVO getFile(String mid);
	
	public Jo_AttachVO getMoviePoster();
	
	public boolean checkProfileImage(String mid);
	
	public Map<String, Object> changeFile(Jo_AttachVO attachVO);
}
