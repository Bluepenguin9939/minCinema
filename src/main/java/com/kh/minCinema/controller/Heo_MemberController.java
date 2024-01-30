package com.kh.minCinema.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.minCinema.domain.Heo_LoginDTO;
import com.kh.minCinema.domain.Heo_MemberVO;
import com.kh.minCinema.service.Heo_MemberService;
import com.kh.minCinema.service.Jo_AttachService;

@Controller
@RequestMapping("/member")
public class Heo_MemberController {

	@Autowired
	private Heo_MemberService heo_MemberService;
	
	@Autowired
	private Jo_AttachService attachService;
	
	@PostMapping("/register")
	public String register(Heo_MemberVO heo_MemberVO) {
		System.out.println("컨트롤러" + heo_MemberVO);
		heo_MemberService.register(heo_MemberVO);
		return "redirect:/member/jo_login";
	}
	
	@PostMapping("/updateBen")
	public void updateBen(Heo_MemberVO heo_MemberVO) {
		heo_MemberService.updateBen(heo_MemberVO);
	}
	
	@PostMapping("/login")
	public void login(Model model, Heo_LoginDTO heo_LoginDTO,RedirectAttributes rttr) {
		Heo_MemberVO heo_MemberVO = heo_MemberService.memberLogin(heo_LoginDTO);
		if (heo_MemberVO == null) {
			return;
		}
		Heo_MemberVO memberVO = attachService.getFile(heo_MemberVO.getMid());
		if (memberVO != null) {
			model.addAttribute("loginInfo", memberVO);
		} else {
			model.addAttribute("loginInfo", heo_MemberVO);
		}
		model.addAttribute("useCookie", heo_LoginDTO.getUseCookie());
	}
	
}
