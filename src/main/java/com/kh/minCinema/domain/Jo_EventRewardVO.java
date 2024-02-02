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
	
	private String mid;
	private String r_month;
	private String r_history;
	private Integer allCount;
}
