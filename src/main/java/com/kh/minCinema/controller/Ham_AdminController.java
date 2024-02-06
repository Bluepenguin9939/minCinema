package com.kh.minCinema.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.minCinema.domain.Ham_CountDateVO;
import com.kh.minCinema.domain.Ham_OneononeVO;
import com.kh.minCinema.domain.Ham_TestVO;
import com.kh.minCinema.domain.Heo_MemberVO;
import com.kh.minCinema.domain.Heo_NoticeCriteria;
import com.kh.minCinema.domain.Heo_NoticePageDTO;
import com.kh.minCinema.domain.Heo_NoticeVO;
import com.kh.minCinema.service.Ham_OneononeService;
import com.kh.minCinema.service.Ham_TestService;
import com.kh.minCinema.service.Heo_MemberService;
import com.kh.minCinema.service.Heo_NoticeService;

import lombok.extern.log4j.Log4j;


@Controller
@RequestMapping("/admin")
@Log4j
public class Ham_AdminController {
	
	@Autowired
	private Ham_TestService ham_TestService;
	
	@Autowired
	private Heo_NoticeService heo_NoticeService;
	
	@Autowired
	private Ham_OneononeService ham_OneononeService;
	
	@Autowired
	private Heo_MemberService heo_MemberService;
	
	@GetMapping("/ham_test3")
	public void ham_test3() {
		
	}
	
	@GetMapping("/ham_admins")
	public void admins(Model model) {
		// 유저측 문의
		List<Ham_CountDateVO> list = ham_OneononeService.inquirySendCount();
		System.out.println("대시보드리수투:"+list);
		// 관리자 답장
		List<Ham_CountDateVO> oList = ham_OneononeService.inquiryReplyCount();
		System.out.println("오픈데이트리수투:"+oList);
		model.addAttribute("oList", oList);
		model.addAttribute("list", list);
		
	}
	//관리자페이지 - 테스트 멤버 목록 
	@GetMapping("/ham_cmanagement")
	public void management(Model model, Heo_MemberVO memberVO) {
		 List<Heo_MemberVO> list = heo_MemberService.memberList(memberVO);
		 System.out.println("회원관리리스트:"+list);
		 model.addAttribute("list",list);
		 
	}
	
	//관리자페이지 - 테스트 멤버 생성 
	@PostMapping("/testMember")
//	@ResponseBody
	public String mct(Heo_MemberVO heo_MemberVO,RedirectAttributes rttr) {
		int count = heo_MemberService.register(heo_MemberVO);
		boolean result = (count == 1) ? true : false; 
		rttr.addFlashAttribute("result", result);
		return "redirect:/admin/ham_cmanagement";
		
	}
	//관리자페이지 - 테스트 멤버 삭제 
	@PostMapping("/testDel")
	@ResponseBody
	public String delete(String mid) {
		int count = heo_MemberService.memberDelete(mid);
		boolean result = (count == 1)? true : false;
		return String.valueOf(result);
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
	@GetMapping("/ham_oneonone")//고객센터 리스트 <-유저 문의에서 받은 리스트
	public void oneonone(Ham_OneononeVO oneononeVO, Model model) {
		List<Ham_OneononeVO> list = ham_OneononeService.listOneonone(oneononeVO);
		System.out.println("리쓰뜨:"+list);
		model.addAttribute("list", list);
		
	}

	@GetMapping("/ham_addevent")
	public void addevent() {
		
	}
	
	@GetMapping("/heo_noticeList")
	public void noticeList(Model model, Heo_NoticeCriteria heo_NoticeCriteria) {
		List<Heo_NoticeVO> list = heo_NoticeService.getNotice(heo_NoticeCriteria);
		int total = heo_NoticeService.getNoticeCount();
		Heo_NoticePageDTO heo_NoticePageDTO = new Heo_NoticePageDTO(heo_NoticeCriteria, total);
		model.addAttribute("pageMaker", heo_NoticePageDTO);
		model.addAttribute("list", list);
	}
	
	@GetMapping("/heo_addNotice")
	public void addNotice(Model model, Heo_NoticeCriteria heo_NoticeCriteria) {
		List<Heo_NoticeVO> list = heo_NoticeService.getNotice(heo_NoticeCriteria);
		int total = heo_NoticeService.getNoticeCount();
		Heo_NoticePageDTO heo_NoticePageDTO = new Heo_NoticePageDTO(heo_NoticeCriteria, total);
		model.addAttribute("pageMaker", heo_NoticePageDTO);
		model.addAttribute("list", list);
		System.out.println("list" + model);
	}
	
	@PostMapping("/heo_addNotice")
	@ResponseBody
	public boolean addNotice(Heo_NoticeVO heo_NoticeVO) {
		int result = heo_NoticeService.addNotice(heo_NoticeVO);
		return (result == 1) ? true : false;
	}
	
	@PostMapping("/heo_delNotice")
	@ResponseBody
	public boolean delNotice(int nno) {
		int result = heo_NoticeService.removeNotice(nno);
		return (result == 1) ? true : false;
	}
	
	@PostMapping("/heo_modifyNotice")
	@ResponseBody
	public boolean modifyNotice(Heo_NoticeVO heo_NoticeVO) {
		int result = heo_NoticeService.modifyNotice(heo_NoticeVO);
		return (result == 1) ? true : false;
	}
		
	@PostMapping(value = "/reply",produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Ham_OneononeVO reply(Ham_OneononeVO ham_OneononeVO,Model model) {			
		System.out.println("브이오:"+ham_OneononeVO);
		Ham_OneononeVO vo = ham_OneononeService.selectGetOne(ham_OneononeVO);
		System.out.println("브이오:"+vo);
		return vo;
	}
	
	@PostMapping("/sendReply")
	public String sendReply(Ham_OneononeVO ham_OneononeVO) {
		System.out.println("하이");
		System.out.println("왔니:" + ham_OneononeVO);
		ham_OneononeService.updateInquiry(ham_OneononeVO);
		return "redirect:/admin/ham_oneonone";
	}
	
	@GetMapping("/ham_test1")
	public void hamTest1() {
		
	}
}
