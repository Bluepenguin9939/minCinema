package com.kh.minCinema.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Je_MovieReservDTO {
	
	private String mov_code;			
	private String mov_title; 	
	private String mov_date;
	private String mov_start_time;
	private String mov_loc;
}
