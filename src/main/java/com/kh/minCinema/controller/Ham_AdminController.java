package com.kh.minCinema.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.kh.minCinema.domain.Ham_TestVO;
import com.kh.minCinema.service.Heo_MemberService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin")
@Log4j
public class Ham_AdminController {
	
	@Autowired
	private Heo_MemberService heo_MemberService;
	
	@GetMapping("/ham_admins")
	public void admins() {
		
	}
	@GetMapping("/ham_cmanagement")
	public void management() {
		
	}
	@PostMapping("/testMember")
	public void mct(Model model,Ham_TestVO testVO) {
		
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
