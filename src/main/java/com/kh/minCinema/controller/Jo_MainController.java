package com.kh.minCinema.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/main")
public class Jo_MainController {
	
	@GetMapping("/test")
	public void test() {
		// jo_main.jsp
		// jo_main2.jsp
	}
	
	@GetMapping("/jo_main")
	public void main() {
		// jo_main.jsp
		// jo_main2.jsp
	}
	
	@GetMapping("/jo_loadMap")
	public void loadMap() {
		
	}
	
	@GetMapping("/jo_event")
	public void event() {
		
	}
}
