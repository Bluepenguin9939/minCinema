package com.kh.minCinema.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.minCinema.domain.Ham_TestVO;
import com.kh.minCinema.domain.Heo_LoginDTO;
import com.kh.minCinema.domain.Heo_MemberVO;
import com.kh.minCinema.mapper.Heo_MemberMapper;

@Service
public class Heo_MemberServiceImpl implements Heo_MemberService {

	@Autowired
	private Heo_MemberMapper heo_MemberMapper;
	
	
	
	
	@Override
	public int register(Heo_MemberVO vo) {
		return heo_MemberMapper.insert(vo);
	}

	@Override
	public void updateBen(Heo_MemberVO vo) {
		heo_MemberMapper.updateActive(vo);
	}

	@Override
	public Heo_MemberVO memberLogin(Heo_LoginDTO heo_LoginDTO) {
		Heo_MemberVO heo_MemberVO = heo_MemberMapper.login(heo_LoginDTO);
		return heo_MemberVO;
	}
	
	//-------------------------- 관리자 ----------------------------------
	@Override
	public List<Heo_MemberVO> memberList(Heo_MemberVO vo) {
		List<Heo_MemberVO> list  = heo_MemberMapper.memberList(vo);
		return list;
	}

	@Override
	public int memberDelete(String mid) {
		
		return heo_MemberMapper.memberDelete(mid);
	}

}
