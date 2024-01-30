package com.kh.minCinema.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.minCinema.domain.Heo_MemberVO;
import com.kh.minCinema.domain.Jo_InfoChangeDTO;
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
		boolean isDup = memberService.checkDupId(mid);
		return String.valueOf(isDup); 
	}
	
	@PostMapping("/checkPw")
	@ResponseBody
	public String checkPw(HttpSession session, String curPw) {
		Heo_MemberVO memberVO = (Heo_MemberVO)session.getAttribute("loginInfo");
		String mid = memberVO.getMid();
		Jo_InfoChangeDTO changeDTO = Jo_InfoChangeDTO.builder()
				.mid(mid).curPw(curPw)
				.build();
		boolean result = memberService.checkPw(changeDTO);
		return String.valueOf(result);
	}
	
	@PostMapping("/changePw")
	@ResponseBody
	public String changePw(HttpSession session, String futurePw) {
		Heo_MemberVO memberVO = (Heo_MemberVO)session.getAttribute("loginInfo");
		String mid = memberVO.getMid();
		Jo_InfoChangeDTO changeDTO = Jo_InfoChangeDTO.builder()
				.mid(mid).futurePw(futurePw)
				.build();
		boolean result = memberService.changePw(changeDTO);
		return String.valueOf(result);
	}
	
	@PostMapping("/changeNick")
	@ResponseBody
	public String changeNick(Jo_InfoChangeDTO changeDTO, HttpSession session) {
		log.info("changeDTO : " + changeDTO);
		boolean changeNickResult = memberService.changeNick(changeDTO);
		if (changeNickResult) {
			Heo_MemberVO memberVO = (Heo_MemberVO)session.getAttribute("loginInfo");
			memberVO.setMnick(changeDTO.getMnick());
			session.setAttribute("loginInfo", memberVO);
		}
		return String.valueOf(changeNickResult);
	}
}
