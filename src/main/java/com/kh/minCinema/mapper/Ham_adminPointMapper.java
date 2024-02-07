package com.kh.minCinema.mapper;

import java.util.List;

import com.kh.minCinema.domain.Heo_PointVO;

public interface Ham_adminPointMapper {
	// 관리자 매출 카운트 
	public List<Heo_PointVO> pointCount();
	
	public List<Heo_PointVO> selectPoint();

	public List<Heo_PointVO> AllPointList(Heo_PointVO heo_PointVO);
}
