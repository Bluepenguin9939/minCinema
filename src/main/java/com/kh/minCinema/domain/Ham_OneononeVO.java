package com.kh.minCinema.domain;

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
	private String remessage;
	private String message;
	private String mtitle;
	private String send_date;
	private String open_date;
	private int monthCount;
	
	private String type; // 검색 조건()
	private String keyword; // 검색어 (사용자 입력)
	
	public String[] getTypeArr() {
		return type == null ? new String[] {} : type.split("");
	}
}
