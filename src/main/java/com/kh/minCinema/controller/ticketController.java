package com.kh.minCinema.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/ticketing")
public class ticketController {
	
	
	
	@GetMapping("/booking")
	public void booking() {
		
	}
	

	@GetMapping("/seat")
	public void seat() {
		
	}
}
