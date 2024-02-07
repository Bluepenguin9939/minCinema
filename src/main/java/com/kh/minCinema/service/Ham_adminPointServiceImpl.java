package com.kh.minCinema.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.minCinema.domain.Heo_PointCriteria;
import com.kh.minCinema.domain.Heo_PointVO;
import com.kh.minCinema.mapper.Ham_adminPointMapper;
import com.kh.minCinema.mapper.Heo_MemberMapper;
import com.kh.minCinema.mapper.Heo_PointMapper;

@Service
public class Ham_adminPointServiceImpl implements Ham_adminPointService {

	@Autowired
	private Ham_adminPointMapper ham_adminPointMapper;

	@Override
	public List<Heo_PointVO> AllPointList(Heo_PointVO heo_PointVO) {
		List<Heo_PointVO> list = ham_adminPointMapper.AllPointList(heo_PointVO);
		return list;
	}

	@Override
	public List<Heo_PointVO> pointCount() {
		List<Heo_PointVO> list = ham_adminPointMapper.pointCount();
		return list;
	}

	@Override
	public List<Heo_PointVO> selectPoint() {
		List<Heo_PointVO> list = ham_adminPointMapper.selectPoint();
		return list;
	}

	
	
}
