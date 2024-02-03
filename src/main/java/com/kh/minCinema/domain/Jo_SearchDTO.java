package com.kh.minCinema.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Jo_SearchDTO {
	
	private String mov_genre;
	
	private String search;
	private String keyword;
	
	public String[] getSearchArr() {
		return search == null ? new String[] {} : search.split("");
	}
}
