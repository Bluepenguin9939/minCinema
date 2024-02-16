package com.kh.minCinema.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.minCinema.domain.Jo_InfoChangeDTO;
import com.kh.minCinema.domain.Jo_ReservedHistoryDTO;
import com.kh.minCinema.domain.Jo_SearchPwDTO;
import com.kh.minCinema.mapper.Je_MovieTheaterMapper;
import com.kh.minCinema.mapper.Jo_MemberMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class Jo_MemberServiceImpl implements Jo_MemberService {

	@Autowired
	private Jo_MemberMapper memberMapper;
	
	@Autowired
	private Je_MovieTheaterMapper theaterMapper;
	
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

	@Override
	public boolean equalEmail(Jo_SearchPwDTO searchPwDTO) {
		int count = memberMapper.equalEmail(searchPwDTO);
		return (count == 1) ? true : false;
	}

	@Override
	@Transactional
	public List<Jo_ReservedHistoryDTO> checkReservedHistory(String mid) {
		List<Jo_ReservedHistoryDTO> reservedList = theaterMapper.selectReservedHistory(mid);
		for (int i = 0; i < reservedList.size(); i++) {
			Jo_ReservedHistoryDTO dto = reservedList.get(i);
			String mov_date_code = dto.getMov_date_code();
			String mov_title = theaterMapper.selectMovieTitle(mov_date_code);
			dto.setMov_title(mov_title);
			reservedList.set(i, dto);
		}
		return reservedList;
	}

	@Override
	public boolean isDupEmail(String memail) {
		int count = memberMapper.isDupEmail(memail);
		return (count == 1) ? true : false;
	}

}
