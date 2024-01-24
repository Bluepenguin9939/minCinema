package com.kh.minCinema.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.minCinema.domain.Heo_MemberVO;
import com.kh.minCinema.service.Heo_MemberService;



@Controller
@RequestMapping("/main")
public class Heo_MainController {

	@GetMapping("/heo_details")
	public void details() {
		
	}
	
	@GetMapping("/heo_pointCharge")
	public void pointCharge() {
		
	}
}
