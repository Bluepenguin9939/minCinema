package com.kh.minCinema.domain;

import lombok.Data;

@Data
public class Heo_PointPageDTO {

	private Heo_PointCriteria heo_PointCriteria;
	private boolean prev;
	private boolean next;
	private int startPage;
	private int endPage;
	private int total;
	
	public Heo_PointPageDTO(Heo_PointCriteria heo_PointCriteria, int total) {
		this.heo_PointCriteria = heo_PointCriteria;
		this.total = total;
		endPage = (int)(Math.ceil(heo_PointCriteria.getPageNum() / 10.0)) * 10;
		startPage = endPage - 9;
		int realEnd = (int)(Math.ceil((float)total / heo_PointCriteria.getAmount()));
		if (realEnd < endPage) {
			endPage = realEnd;
		}
		prev = startPage > 1;
		next = endPage < realEnd;
	}
}
