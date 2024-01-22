package com.kh.minCinema.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/main")
public class Jo_MainController {
	
	@GetMapping("/jo_main")
	public void main() {
		
	}
	
	@GetMapping("/heo_details")
	public void details() {
		
	}
}
