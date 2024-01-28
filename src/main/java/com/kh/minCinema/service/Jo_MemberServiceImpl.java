package com.kh.minCinema.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.minCinema.mapper.Jo_MemberMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class Jo_MemberServiceImpl implements Jo_MemberService {

	@Autowired
	private Jo_MemberMapper memberMapper;
	
	@Override
	public boolean checkDupId(String mid) {
		int isDupCount = memberMapper.selectDupId(mid);
		if (isDupCount == 1) {
			return true;
		}
		return false;
	}

}
