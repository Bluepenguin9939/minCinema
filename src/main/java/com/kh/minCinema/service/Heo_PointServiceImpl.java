package com.kh.minCinema.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public boolean pointCharge(Heo_PointVO heo_PointVO) {
		System.out.println("서비스 포차1 : " + heo_PointVO);
		int count1 = heo_PointMapper.insertPoint(heo_PointVO);
		int count2 = heo_MemberMapper.updatePoint(heo_PointVO);
		return (count1 + count2 == 2) ? true : false;
	}

}
