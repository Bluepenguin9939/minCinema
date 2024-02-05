package com.kh.minCinema.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.minCinema.domain.Heo_NoticeCriteria;
import com.kh.minCinema.domain.Heo_NoticeVO;
import com.kh.minCinema.mapper.Heo_NoticeMapper;

@Service
public class Heo_NoticeServiceImpl implements Heo_NoticeService {
	
	@Autowired
	private Heo_NoticeMapper heo_NoticeMapper;

	@Override
	public int addNotice(Heo_NoticeVO heo_NoticeVO) {
		return heo_NoticeMapper.insertNotice(heo_NoticeVO);
	}

	@Override
	public List<Heo_NoticeVO> getNotice(Heo_NoticeCriteria heo_NoticeCriteria) {
		return heo_NoticeMapper.selectNotice(heo_NoticeCriteria);
	}

	@Override
	public int modifyNotice(Heo_NoticeVO heo_NoticeVO) {
		return heo_NoticeMapper.updateNotice(heo_NoticeVO);
	}

	@Override
	public int removeNotice(int nno) {
		return heo_NoticeMapper.deleteNotice(nno);
	}

	@Override
	public String getContent(int nno) {
		return heo_NoticeMapper.selectContent(nno);
	}

	@Override
	public void plusCount(int nno) {
		heo_NoticeMapper.addCount(nno);
	}

	@Override
	public int getNoticeCount() {
		return heo_NoticeMapper.getNoticeCount();
	}
}
