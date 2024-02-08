package com.kh.minCinema.service;

import java.util.List;

import com.kh.minCinema.domain.Jo_InfoChangeDTO;
import com.kh.minCinema.domain.Jo_ReservedHistoryDTO;
import com.kh.minCinema.domain.Jo_SearchPwDTO;

public interface Jo_MemberService {
	
	public boolean checkDupId(String mid);
	
	public boolean checkPw(Jo_InfoChangeDTO changeDTO);
	
	public boolean changePw(Jo_InfoChangeDTO changeDTO);
	
	public boolean changeNick(Jo_InfoChangeDTO changeDTO);
	
	public boolean equalEmail(Jo_SearchPwDTO searchPwDTO);
	
	public List<Jo_ReservedHistoryDTO> checkReservedHistory(String mid);
}
