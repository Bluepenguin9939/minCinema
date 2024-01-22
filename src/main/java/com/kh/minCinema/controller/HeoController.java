package com.kh.minCinema.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/main")
public class HeoController {

	@GetMapping("/heo_details")
	public void heo_details() {
		
	}
}
