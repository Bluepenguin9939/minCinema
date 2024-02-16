package com.kh.minCinema.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Jo_ReservedHistoryDTO {
	
	private String mov_title;
	private String mov_date_code;
	private String mov_theater;
	private String mov_theater_date;
	private String mov_theater_time;
	private String seat_name_res;
}
