package com.kh.minCinema.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
@RequestMapping("/notice")
public class Ham_NoticelistController {

	@GetMapping("/ham_notice")
	public void notice() {
		
	}
}