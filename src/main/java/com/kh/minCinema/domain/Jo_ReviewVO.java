package com.kh.minCinema.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Jo_ReviewVO {
	
	private Integer rno;
	private String mid;
	private String mnick;
	private String mov_code;
	private String r_content;
	private String r_date;
}
