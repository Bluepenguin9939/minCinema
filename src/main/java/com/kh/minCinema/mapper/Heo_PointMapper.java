package com.kh.minCinema.mapper;

import java.util.List;

import com.kh.minCinema.domain.Heo_PointCriteria;
import com.kh.minCinema.domain.Heo_PointVO;

public interface Heo_PointMapper {

	public int insertPoint(Heo_PointVO heo_PointVO);
	
	public List<Heo_PointVO> getPointList(Heo_PointCriteria heo_PointCriteria);
	
	public int getPointListCount(String mid);
	
	// 관리자 매출 카운트 
	public List<Heo_PointVO> pointCount();
	
	public List<Heo_PointVO> selectPoint();
}
