package com.kh.minCinema.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class Ham_AdminController {
	
	@GetMapping("/ham_admins")
	public void admins() {
		
	}
	@GetMapping("/test")
	public void test() {
		
	}
	@GetMapping("/test2")
	public void test2() {
		
	}
}
