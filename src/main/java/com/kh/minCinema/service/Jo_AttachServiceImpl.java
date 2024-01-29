package com.kh.minCinema.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.minCinema.domain.Jo_AttachVO;
import com.kh.minCinema.mapper.Jo_AttachMapper;

@Service
public class Jo_AttachServiceImpl implements Jo_AttachService {

	@Autowired
	private Jo_AttachMapper attachMapper;
	
	@Override
	public boolean addFile(Jo_AttachVO attachVO) {
		int count = attachMapper.insertFile(attachVO);
		if (count == 1) {
			return true;
		}
		return false;
	}

}
