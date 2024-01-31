package com.kh.minCinema.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Ham_TestVO {
	private int tmno;
	private String tmid;
	private String tmpw;
	private String tmnick;
	private String tmname;
	private String tmemail;
	private String tmtel;
	private String loginInfo;
	
	private String type; // 검색 조건(제목-T, 내용-C, 작성자-W)
	private String keyword; // 검색어 (사용자 입력)
	
	public String[] getTypeArr() {
		return type == null ? new String[] {} : type.split("");
	}
}
