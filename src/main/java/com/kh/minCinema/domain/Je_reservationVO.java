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
public class Je_reservationVO {
	String movieTitle; //영화제목
	String movieDate;  //영화상영일
	String movieTime;  //영화 시작시간
	String movieTheater; //영화 상영관
	List<String> reservedSeat; //예약한 좌석번호
	Map<String, String> age;  //예약 좌석 연령
	
}
