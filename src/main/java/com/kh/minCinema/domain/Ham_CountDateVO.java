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
public class Ham_CountDateVO {
	private int rn;
	private String msg_id;
	private String sender;
	private String remessage;
	private String message;
	private String mtitle;
	private String send_date;
	private String open_date;
	private int monthCount;
	private int replyCount;
	
}
