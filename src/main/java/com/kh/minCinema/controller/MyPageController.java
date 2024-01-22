package com.kh.minCinema.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/myPage")
public class MyPageController {
	
	@GetMapping("/jo_myInfo")
	public void myPage() {
		
	}
	
	@GetMapping("/jo_myPoint")
	public void myPoint() {
		
	}
}
