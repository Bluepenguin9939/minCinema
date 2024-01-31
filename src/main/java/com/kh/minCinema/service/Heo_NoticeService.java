package com.kh.minCinema.service;

import java.util.List;

import com.kh.minCinema.domain.Heo_NoticeVO;

public interface Heo_NoticeService {

	public int addNotice(Heo_NoticeVO heo_NoticeVO);
	
	public List<Heo_NoticeVO> getNotice();
	
	public int modifyNotice(Heo_NoticeVO heo_NoticeVO);
	
	public int removeNotice(int nno);
}
