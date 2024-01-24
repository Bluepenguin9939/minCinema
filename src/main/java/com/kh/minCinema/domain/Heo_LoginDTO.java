package com.kh.minCinema.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Heo_LoginDTO {

	private String mid;
	private String mpw;
	private Boolean useCookie;
}
