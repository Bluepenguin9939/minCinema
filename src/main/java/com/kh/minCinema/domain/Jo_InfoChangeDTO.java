package com.kh.minCinema.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Jo_InfoChangeDTO {
	
	private String mid;
	private String curPw;
	private String futurePw;
	private String mnick;
}
