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
public class Ham_OneononeVO {
	private int rn;
	private String msg_id;
	private String sender;
	private String receiver;
	private String message;
	private String mtitle;
	private Date send_date;
	private Date open_date;
}
