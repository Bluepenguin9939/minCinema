package com.kh.minCinema.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Jo_MovieVO {
	
	private String mov_code;			// 영화 코드
	private String mov_title; 			// 영화 타이틀
	private String mov_director;		// 영화 감독
	private String mov_actor;			// 영화 배우
	private String mov_releaseDate;		// 영화 개봉일
	private String mov_plot;			// 영화 줄거리
	private Integer mov_runtime;		// 영화 런타임
	private String mov_rating;			// 영화 관람기준
	private String mov_genre;			// 영화 장르
//	private String mov_posterURL;		// 영화 포스터URL
//	private String mov_stillURL;		// 영화 스틸컷URL
}
