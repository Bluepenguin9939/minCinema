package com.kh.minCinema.service;

import java.util.List;

import com.kh.minCinema.domain.Heo_LoginDTO;
import com.kh.minCinema.domain.Heo_MemberVO;

public interface Heo_MemberService {
	
	public int kakaoCheck(String mtel);

	public int register(Heo_MemberVO heo_MemberVO);
	
	public int updateBen(Heo_MemberVO heo_MemberVO);
	
	public Heo_MemberVO memberLogin(Heo_LoginDTO heo_LoginDTO);
	
	public List<Heo_MemberVO> memberList(Heo_MemberVO vo);
	
	public int memberDelete(String mid);
	
	public String getActive(String mid);
	
	public int checkPassword(Heo_MemberVO heo_MemberVO);
	
	public Heo_MemberVO getKakaoInfo(Heo_MemberVO heo_MemberVO);
}
