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
	private int mno;
	private String mid;
	private String mpw;
	private String memail;
	private String mname;
	private String mnick;
	private String mtel;
	private Integer mpoint;
	private String mactive;
	private Date mregdate;
	
	private String upload_path;
	private String file_name;
	private String uuid;
	private Integer coupon;
	
	
	//관리자 회원관리 목록 검색 
	private String type; // 검색 조건(제목-T, 내용-C, 작성자-W)
	private String keyword; // 검색어 (사용자 입력)
	
	public String[] getTypeArr() {
		return type == null ? new String[] {} : type.split("");
	}
}
