package com.kh.minCinema.mapper;

import java.util.List;

import com.kh.minCinema.domain.Heo_LoginDTO;
import com.kh.minCinema.domain.Heo_MemberVO;
import com.kh.minCinema.domain.Heo_PointVO;

public interface Heo_MemberMapper {
	
	public int kakaoCheckInfo(String mtel);

	public int insert(Heo_MemberVO heo_MemberVO);
	
	public int updateActive(Heo_MemberVO heo_MemberVO);
	
	public Heo_MemberVO login(Heo_LoginDTO heo_LoginDTO);
	
	public int updatePoint(Heo_PointVO heo_PointVO);
	
	public Heo_MemberVO getKakaoLoginInfo(Heo_MemberVO heo_MemberVO);
	
	//관리자
	public List<Heo_MemberVO> memberList(Heo_MemberVO vo);
	
	public int memberDelete(String mid);
	
	public String selectActive(String mid);
	
	public int selectPassword(Heo_MemberVO heo_MemberVO);
}
