package com.kh.minCinema.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.minCinema.domain.Heo_PointCriteria;
import com.kh.minCinema.domain.Heo_PointVO;
import com.kh.minCinema.mapper.Heo_MemberMapper;
import com.kh.minCinema.mapper.Heo_PointMapper;

@Service
public class Heo_PointServiceImpl implements Heo_PointService {

	@Autowired
	private Heo_PointMapper heo_PointMapper;
	@Autowired
	private Heo_MemberMapper heo_MemberMapper;
	
	@Override
	@Transactional
	public boolean pointCharge(Heo_PointVO heo_PointVO) {
		System.out.println("서비스 포차1 : " + heo_PointVO);
		int count1 = heo_PointMapper.insertPoint(heo_PointVO);
		int count2 = heo_MemberMapper.updatePoint(heo_PointVO);
		return (count1 + count2 == 2) ? true : false;
	}

	@Override
	public List<Heo_PointVO> getList(Heo_PointCriteria heo_PointCriteria) {
		List<Heo_PointVO> list = heo_PointMapper.getPointList(heo_PointCriteria);
		return list;
	}

	@Override
	public int getCount(String mid) {
		int total = heo_PointMapper.getPointListCount(mid);
		return total;
	}

	
}
