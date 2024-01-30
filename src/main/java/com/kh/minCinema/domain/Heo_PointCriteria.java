package com.kh.minCinema.domain;

import lombok.Data;

@Data
public class Heo_PointCriteria {

	private int pageNum;		// 페이지 번호
	private int amount;			// 보여줄 데이터 수
	private int startRow;		// 시작 행?
	private int endRow;			// 끝 행?
	private String mid;
	
	public Heo_PointCriteria() {
		this(1, 5, 1, 5);
		setRows();
	}
	
	public Heo_PointCriteria(int pageNum, int amount, int startRow, int endRow) {
		this.pageNum = pageNum;
		this.amount = amount;
		this.startRow = startRow;
		this.endRow = endRow;
	}
	
	private void setRows() {
		this.endRow = this.pageNum * this.amount;
		startRow = endRow - (amount - 1);
	}
	
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
		setRows();
	}
}
