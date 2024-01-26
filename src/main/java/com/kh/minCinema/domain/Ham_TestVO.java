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

	private String tmid;
	private String tmnick;
	private String tmname;
	private String tmemail;
	private String tmtel;
	
}
