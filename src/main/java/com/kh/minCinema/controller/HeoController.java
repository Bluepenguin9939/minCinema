package com.kh.minCinema.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequestMapping("/main")
public class HeoController {

	@GetMapping("/heo_details")
	public void details() {
		
	}
	
	@GetMapping("/heo_pointCharge")
	public void pointCharge() {
		
	}
	
}
