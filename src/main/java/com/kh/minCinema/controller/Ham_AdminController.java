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
	@GetMapping("/ham_cmanagement")
	public void management() {
		
	}
	@GetMapping("/ham_movieadd")
	public void movieadd() {
		
	}
	@GetMapping("/ham_addpoint")
	public void addpoint() {
		
	}
	@GetMapping("/ham_oneonone")
	public void oneonone() {
		
	}
	@GetMapping("/ham_addevent")
	public void addevent() {
		
	}
	
}
