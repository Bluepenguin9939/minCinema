package com.kh.minCinema.mapper;

import com.kh.minCinema.domain.Jo_InfoChangeDTO;

public interface Jo_MemberMapper {
	
	public int selectDupId(String mid);
	
	public String checkPw(Jo_InfoChangeDTO changeDTO);
	
	public int updatePw(Jo_InfoChangeDTO changeDTO);
	
	public int updateNick(Jo_InfoChangeDTO changeDTO);
}
