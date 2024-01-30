package com.kh.minCinema.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.minCinema.domain.Ham_OneononeVO;
import com.kh.minCinema.service.Ham_OneononeService;
@Controller
@RequestMapping("/notice")
public class Ham_NoticelistController {
	
	@Autowired
	private Ham_OneononeService ham_OneononeService;

	@GetMapping("/ham_notice")//공지사항
	public void notice() {
		
	}
	@GetMapping("/ham_often")//자주묻는질문
	public void often() {
		
	}
	@GetMapping("/ham_inquiry")// 1대1문의
	public void inquiry(Model model) {
		System.out.println("1대1문의");
		 List<Ham_OneononeVO> list = ham_OneononeService.selectOne();
		 model.addAttribute("list", list);
		 System.out.println("와우:"+list);
	}
	@PostMapping("/ono")
//	@ResponseBody
	public String ono(Ham_OneononeVO ham_OneononeVO) {
		System.out.println("123456"+ham_OneononeVO);
	 ham_OneononeService.insertInquiry(ham_OneononeVO);
	 return "redirect:/notice/ham_inquiry";
	}
}