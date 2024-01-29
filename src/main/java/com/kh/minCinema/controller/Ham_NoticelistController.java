package com.kh.minCinema.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
@RequestMapping("/notice")
public class Ham_NoticelistController {

	@GetMapping("/ham_notice")//공지사항
	public void notice() {
		
	}
	@GetMapping("/ham_often")//자주묻는질문
	public void often() {
		
	}
	@GetMapping("/ham_inquiry")// 1대1문의
	public void inquiry() {
		
	}
}