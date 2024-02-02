package com.kh.minCinema.domain;

import java.util.List;
import java.util.Map;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Je_MovieDateInfoDTO {
	String mov_date_code; // 영화 일정구분 코드
	String mov_code;	// 영화 코드(고유번호)
	String mov_screen_date; // 영화 상영일
	
	String mov_start_time; // 상영시작시간
	String mov_theater;		// 상영관 (1~7 관)
}
