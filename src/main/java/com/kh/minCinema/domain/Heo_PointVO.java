package com.kh.minCinema.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Heo_PointVO {

	private Integer pid;
	private String mid;
	private Integer ppoint;
	private String pcode;
	private String pdate;
	
	//
	private String type; // 검색 조건()
	private String keyword; // 검색어 (사용자 입력)
	
	public String[] getTypeArr() {
		return type == null ? new String[] {} : type.split("");
	}
}
