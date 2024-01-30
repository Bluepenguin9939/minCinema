package com.kh.minCinema.service;

import com.kh.minCinema.domain.Jo_InfoChangeDTO;

public interface Jo_MemberService {
	
	public boolean checkDupId(String mid);
	
	public boolean checkPw(Jo_InfoChangeDTO changeDTO);
	
	public boolean changePw(Jo_InfoChangeDTO changeDTO);
	
	public boolean changeNick(Jo_InfoChangeDTO changeDTO);
}
