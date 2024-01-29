package com.kh.minCinema.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.minCinema.service.Jo_MemberService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/member")
@Log4j
public class Jo_MemberController {
	
	@Autowired
	private Jo_MemberService memberService;
	
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
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@PostMapping("/isDupId")
	@ResponseBody
	public String isDupId(String mid) {
		log.info("mid : " + mid);
		boolean isDup = memberService.checkDupId(mid);
		log.info("isDup : " + isDup);
		return String.valueOf(isDup); 
	}
}
