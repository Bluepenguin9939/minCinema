package com.kh.minCinema.mapper;

import com.kh.minCinema.domain.Jo_InfoChangeDTO;
import com.kh.minCinema.domain.Jo_SearchPwDTO;

public interface Jo_MemberMapper {
	
	public int selectDupId(String mid);
	
	public String checkPw(Jo_InfoChangeDTO changeDTO);
	
	public int updatePw(Jo_InfoChangeDTO changeDTO);
	
	public int updateNick(Jo_InfoChangeDTO changeDTO);
	
	public int equalEmail(Jo_SearchPwDTO searchPwDTO);
}
