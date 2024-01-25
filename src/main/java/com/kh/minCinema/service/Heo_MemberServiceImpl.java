package com.kh.minCinema.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.minCinema.domain.Heo_LoginDTO;
import com.kh.minCinema.domain.Heo_MemberVO;
import com.kh.minCinema.mapper.Heo_MemberMapper;

@Service
public class Heo_MemberServiceImpl implements Heo_MemberService {

	@Autowired
	private Heo_MemberMapper heo_MemberMapper;
	
	@Override
	public void register(Heo_MemberVO vo) {
		heo_MemberMapper.insert(vo);
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

}