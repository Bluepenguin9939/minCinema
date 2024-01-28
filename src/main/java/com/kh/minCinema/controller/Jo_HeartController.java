package com.kh.minCinema.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.minCinema.domain.Heo_MemberVO;
import com.kh.minCinema.domain.Jo_HeartDTO;
import com.kh.minCinema.service.Jo_HeartService;

@RestController
@RequestMapping("/heart")
public class Jo_HeartController {
	
	@Autowired
	private Jo_HeartService heartService;
	
	@PostMapping("/addHeart/{mov_code}")
	public void addHeart(@PathVariable("mov_code") String mov_code, HttpSession session) {
		Heo_MemberVO memberVO = (Heo_MemberVO)session.getAttribute("loginInfo");
		String mid = memberVO.getMid();
		Jo_HeartDTO heartDTO = Jo_HeartDTO.builder()
				.mid(mid).mov_code(mov_code)
				.build();
		heartService.addHeart(heartDTO);
	}
	
	@PostMapping("/removeHeart/{mov_code}")
	public void removeHeart(@PathVariable("mov_code") String mov_code, HttpSession session) {
		Heo_MemberVO memberVO = (Heo_MemberVO)session.getAttribute("loginInfo");
		String mid = memberVO.getMid();
		Jo_HeartDTO heartDTO = Jo_HeartDTO.builder()
				.mid(mid).mov_code(mov_code)
				.build();
		heartService.removeHeart(heartDTO);
	}
}
