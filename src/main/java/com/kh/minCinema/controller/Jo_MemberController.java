package com.kh.minCinema.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class Jo_MemberController {
	
	@GetMapping("/jo_login")
	public void login() {
		// jo_login.jsp
	}
	
	@GetMapping("/jo_pwSearch")
	public void pwSearch() {
		
	}
	
	@GetMapping("/jo_register")
	public void register() {
		
	}
}
