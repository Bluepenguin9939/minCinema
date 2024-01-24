package com.kh.minCinema.service;

import com.kh.minCinema.domain.Heo_LoginDTO;
import com.kh.minCinema.domain.Heo_MemberVO;

public interface Heo_MemberService {

	public void register(Heo_MemberVO heo_MemberVO);
	
	public void updateBen(Heo_MemberVO heo_MemberVO);
	
	public Heo_MemberVO memberLogin(Heo_LoginDTO heo_LoginDTO);
}
