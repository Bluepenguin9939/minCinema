package com.kh.minCinema.controller;

import java.util.UUID;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.minCinema.domain.Heo_MemberVO;
import com.kh.minCinema.domain.Jo_InfoChangeDTO;
import com.kh.minCinema.domain.Jo_SearchPwDTO;
import com.kh.minCinema.service.Jo_MemberService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/member")
@Log4j
public class Jo_MemberController {
	
	@Autowired
	private Jo_MemberService memberService;
	
	@Autowired
	private JavaMailSender mailSender;
	
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
		boolean changeNickResult = memberService.changeNick(changeDTO);
		if (changeNickResult) {
			Heo_MemberVO memberVO = (Heo_MemberVO)session.getAttribute("loginInfo");
			memberVO.setMnick(changeDTO.getMnick());
			session.setAttribute("loginInfo", memberVO);
		}
		return String.valueOf(changeNickResult);
	}
	
	@PostMapping("/searchPw")
	public String searchPw(String uemail, String uid) {
		String uuid = UUID.randomUUID().toString();
		String mpw = uuid.substring(0, uuid.indexOf("-"));
		
		MimeMessagePreparator preparator = new MimeMessagePreparator() {
			
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				MimeMessageHelper helper = new MimeMessageHelper(
						mimeMessage,
						false, // multipart
						"utf-8"
						);
				helper.setFrom("q430310@gmail.com");
				helper.setTo(uemail);
				helper.setSubject("새로운 비밀번호를 드립니다.");
				helper.setText("로그인 후 비밀번호를 재설정 해주세요!\n"
						+ "변경된 비밀번호 : " + mpw);
			}
		};
		mailSender.send(preparator);
		Jo_InfoChangeDTO changeDTO = Jo_InfoChangeDTO.builder()
				.mid(uid).futurePw(mpw)
				.build();
		memberService.changePw(changeDTO);
		
		return "redirect:/member/jo_login";
	}
	
	@PostMapping(value = "/equalEmail",
				 produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Boolean equalEmail(Jo_SearchPwDTO searchPwDTO) {
		boolean result = memberService.equalEmail(searchPwDTO);
		return result;
	}
	
	@PostMapping(value = "/isDupEmail",
				 produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Boolean isDupEmail(String memail) {
		boolean result = memberService.isDupEmail(memail);
		return result;
	}
}
