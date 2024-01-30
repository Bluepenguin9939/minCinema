package com.kh.minCinema.mapper;

import com.kh.minCinema.domain.Heo_MemberVO;
import com.kh.minCinema.domain.Jo_AttachVO;

public interface Jo_AttachMapper {
	
	public int insertFile(Jo_AttachVO attachVO);
	
	public Heo_MemberVO selectFile(String mid);
	
	public int checkProfileImage(String mid);
	
	public int deleteFile(String uuid);
	
	public Jo_AttachVO selectDeleteUuid(String mid);
}
