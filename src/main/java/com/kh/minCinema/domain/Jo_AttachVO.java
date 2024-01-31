package com.kh.minCinema.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.NoArgsConstructor;
import lombok.Data;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Jo_AttachVO {
	
	private String uuid;
	private String upload_path;
	private String file_name;
	private String mid;
	private String mov_code;
}
