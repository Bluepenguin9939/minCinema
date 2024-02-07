package com.kh.minCinema.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.minCinema.domain.Ham_OneononeVO;
import com.kh.minCinema.domain.Heo_MemberVO;
import com.kh.minCinema.domain.Heo_NoticeCriteria;
import com.kh.minCinema.domain.Heo_NoticePageDTO;
import com.kh.minCinema.domain.Heo_NoticeVO;
import com.kh.minCinema.service.Ham_OneononeService;
import com.kh.minCinema.service.Heo_NoticeService;
@Controller
@RequestMapping("/notice")
public class Ham_NoticelistController {
	
	@Autowired
	private Ham_OneononeService ham_OneononeService;
	
	@Autowired
	private Heo_NoticeService heo_NoticeService;

	
	//HEO제작
	@GetMapping("/ham_notice")//공지사항
	public void notice(Model model, Heo_NoticeCriteria heo_NoticeCriteria) {
		System.out.println("확인"+heo_NoticeCriteria);
		List<Heo_NoticeVO> list = heo_NoticeService.getNotice(heo_NoticeCriteria);
		System.out.println("확인"+list);
		int total = heo_NoticeService.getNoticeCount();
		Heo_NoticePageDTO heo_NoticePageDTO = new Heo_NoticePageDTO(heo_NoticeCriteria, total);
		System.out.println("확인"+heo_NoticePageDTO);
		model.addAttribute("pageMaker", heo_NoticePageDTO);
		model.addAttribute("list", list);
	}
	
	//HEO제작
	@GetMapping("/heo_noticeList")
	public void noticeList(Model model, Heo_NoticeCriteria heo_NoticeCriteria) {
		List<Heo_NoticeVO> list = heo_NoticeService.getNotice(heo_NoticeCriteria);
		int total = heo_NoticeService.getNoticeCount();
		Heo_NoticePageDTO heo_NoticePageDTO = new Heo_NoticePageDTO(heo_NoticeCriteria, total);
		model.addAttribute("pageMaker", heo_NoticePageDTO);
		model.addAttribute("list", list);
	}
	
	//HEO제작
	@GetMapping(value = "/selectNotice", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String selectNotice(int nno) {
		String content = heo_NoticeService.getContent(nno);
		heo_NoticeService.plusCount(nno);
		System.out.println(content);
		return content;
	}
	
	@GetMapping("/ham_often")//자주묻는질문
	public void often() {
		
	}
	@GetMapping("/ham_inquiry")// 1대1문의
	public void inquiry(Model model,HttpSession session) {
		System.out.println("1대1문의");
		Heo_MemberVO loginInfo = (Heo_MemberVO)session.getAttribute("loginInfo");
		String sender = loginInfo.getMid();
		 List<Ham_OneononeVO> list = ham_OneononeService.selectGetReply(sender);
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
//	@GetMapping("/memberViewReply")
//	public void memberViewReply(Ham_OneononeVO ham_OneononeVO) {
//		System.out.println("하와잉");
//		ham_OneononeService.selectViewReply(ham_OneononeVO);
//		System.out.println("무엇이 들어있나요?:"+ham_OneononeVO);
//	}
}