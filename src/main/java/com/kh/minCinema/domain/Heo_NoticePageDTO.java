package com.kh.minCinema.domain;

import lombok.Data;

@Data
public class Heo_NoticePageDTO {

	private Heo_NoticeCriteria heo_NoticeCriteria;
	private boolean prev;
	private boolean next;
	private int startPage;
	private int endPage;
	private int total;
	
	public Heo_NoticePageDTO(Heo_NoticeCriteria heo_NoticeCriteria, int total) {
		this.heo_NoticeCriteria = heo_NoticeCriteria;
		this.total = total;
		endPage = (int)(Math.ceil(heo_NoticeCriteria.getPageNum() / 10.0)) * 10;
		startPage = endPage - 9;
		int realEnd = (int)(Math.ceil((float)total / heo_NoticeCriteria.getAmount()));
		if (realEnd < endPage) {
			endPage = realEnd;
		}
		prev = startPage > 1;
		next = endPage < realEnd;
	}
}
