package com.kh.minCinema.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Jo_EventRewardVO {
	
	private String mid;		  // 출석 한 아이디
	private String r_month;   // 출석 한 달
	private String r_history; // 출석 내역
	private Integer allCount; // 출석 일 수
}
