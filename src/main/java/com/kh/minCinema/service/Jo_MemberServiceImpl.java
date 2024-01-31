package com.kh.minCinema.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.minCinema.domain.Jo_InfoChangeDTO;
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

	@Override
	public boolean checkPw(Jo_InfoChangeDTO changeDTO) {
		String curPw = memberMapper.checkPw(changeDTO);
		if (curPw.equals(changeDTO.getCurPw())) {
			return true;
		}
		return false;
	}

	@Override
	public boolean changePw(Jo_InfoChangeDTO changeDTO) {
		int count = memberMapper.updatePw(changeDTO);
		if (count == 1) {
			return true;
		}
		return false;
	}

	@Override
	public boolean changeNick(Jo_InfoChangeDTO changeDTO) {
		int count = memberMapper.updateNick(changeDTO);
		if (count == 1) {
			return true;
		}
		return false;
	}

}
