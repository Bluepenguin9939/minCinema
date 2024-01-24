package com.kh.minCinema.mapper;

import com.kh.minCinema.domain.Heo_LoginDTO;
import com.kh.minCinema.domain.Heo_MemberVO;

public interface Heo_MemberMapper {

	public void insert(Heo_MemberVO heo_MemberVO);
	
	public void updateActive(Heo_MemberVO heo_MemberVO);
	
	public Heo_MemberVO login(Heo_LoginDTO heo_LoginDTO);
}
