package com.kh.minCinema.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.minCinema.service.Jo_MovieService;

@Controller
@RequestMapping("/admin")
public class Jo_AdminController {
	
	@Autowired
	private Jo_MovieService movieService;
	
	@PostMapping("/addMovie")
	public void addMovie() {
		
	}
}
