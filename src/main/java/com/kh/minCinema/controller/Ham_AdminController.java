package com.kh.minCinema.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.minCinema.domain.Ham_TestVO;
import com.kh.minCinema.service.Ham_TestService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin")
@Log4j
public class Ham_AdminController {
	
	@Autowired
	private Ham_TestService ham_TestService;
	
	@GetMapping("/ham_admins")
	public void admins() {
		
	}
	//관리자페이지 - 테스트 멤버 목록 
	@GetMapping("/ham_cmanagement")
	public void management(Model model) {
		 List<Ham_TestVO> list = ham_TestService.testMemberList();
		 model.addAttribute("list",list);
		 
	}
	
	//관리자페이지 - 테스트 멤버 생성 
	@PostMapping("/testMember")
//	@ResponseBody
	public String mct(Ham_TestVO testVO,RedirectAttributes rttr) {
		int count = ham_TestService.TestInsert(testVO);
		boolean result = (count == 1) ? true : false; 
		rttr.addFlashAttribute("result", result);
		return "redirect:/admin/ham_cmanagement";
		
	}
	@GetMapping("/ham_addmovie")
	public void movieadd() {          
		
	}
//	@PostMapping("/addMovie")
//	public void addMovie(MultipartFile[] uploadFile) {
//		
//		log.info("업로드 파일:"+uploadFile);
//	}
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
