package com.kh.minCinema.service;

import java.util.List;

import com.kh.minCinema.domain.Heo_PointCriteria;
import com.kh.minCinema.domain.Heo_PointVO;

public interface Heo_PointService {

	public boolean pointCharge(Heo_PointVO heo_PointVO);
	
	public List<Heo_PointVO> getList(Heo_PointCriteria heo_PointCriteria);
	
	public int getCount(String mid);
	
	public List<Heo_PointVO> pointCount();
	
	public List<Heo_PointVO> selectPoint();
}
