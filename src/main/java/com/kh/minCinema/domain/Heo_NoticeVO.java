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
public class Heo_NoticeVO {
	private Integer nno;
	private String ntitle;
	private String ncontent;
	private Date nregdate;
	private Integer ncount;
}
