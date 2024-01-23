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
public class Heo_MemberVO {

	private String mid;
	private String mpw;
	private String memail;
	private String mname;
	private String mnick;
	private String mtel;
	private Integer mpoint;
	private String mactive;
	private Date mregdate;
}
