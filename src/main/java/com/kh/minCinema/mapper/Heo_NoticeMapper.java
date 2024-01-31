package com.kh.minCinema.mapper;

import java.util.List;

import com.kh.minCinema.domain.Heo_NoticeVO;

public interface Heo_NoticeMapper {
	public int insertNotice(Heo_NoticeVO heo_NoticeVO);
	
	public List<Heo_NoticeVO> selectNotice();
	
	public int deleteNotice(int nno);
	
	public int updateNotice(Heo_NoticeVO heo_NoticeVO);
}
