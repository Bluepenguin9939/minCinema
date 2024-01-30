package com.kh.minCinema.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Ham_DateVO {
	private int rn;
	private String msg_id;
	private String sender;
	private String message;
	private String mtitle;
	private String send_date;
	private String open_date;
}
