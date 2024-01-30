package com.kh.minCinema.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.minCinema.domain.Ham_DateVO;
import com.kh.minCinema.domain.Ham_OneononeVO;
import com.kh.minCinema.domain.Ham_TestVO;
import com.kh.minCinema.service.Ham_OneononeService;
import com.kh.minCinema.service.Ham_TestService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin")
@Log4j
public class Ham_AdminController {
	
	@Autowired
	private Ham_TestService ham_TestService;
	
	@Autowired
	private Ham_OneononeService ham_OneononeService;
	
	@GetMapping("/ham_admins")
	public void admins() {
		
	}
	//관리자페이지 - 테스트 멤버 목록 
	@GetMapping("/ham_cmanagement")
	public void management(Model model, Ham_TestVO testVO) {
		 List<Ham_TestVO> list = ham_TestService.testMemberList(testVO);
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
	//관리자페이지 - 테스트 멤버 삭제 
	@PostMapping("/testDel")
	@ResponseBody
	public String delete(String tmid) {
		System.out.println("tmid:"+tmid);
		int count = ham_TestService.testMemberDelete(tmid);
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
	public void oneonone(Model model) {
		List<Ham_OneononeVO> list = ham_OneononeService.selectOne();
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		List<Ham_DateVO> dList = new ArrayList<>();
		Ham_DateVO ham_DateVO = new Ham_DateVO();
		for(Ham_OneononeVO vo: list) {
			 int rn = vo.getRn();
			 Date format= vo.getSend_date();
			 String msg_id = vo.getMsg_id();
			 String sender = vo.getSender();
			 String  mtitle = vo.getMtitle();
			 String message = vo.getMessage();
			 String send_date = sf.format(format);
			 if(vo.getOpen_date() != null) {
				 Date format1 = vo.getOpen_date();
				 String open_date = sf.format(format1);
				  ham_DateVO = new Ham_DateVO(rn,msg_id, sender, message, mtitle, send_date, open_date);
			 }else {
				 ham_DateVO = new Ham_DateVO(rn,msg_id, sender, message, mtitle, send_date, null);				 
			 }
			 dList.add(ham_DateVO);
		}
		model.addAttribute("dList", dList);
	}

	@GetMapping("/ham_addevent")
	public void addevent() {
		
	}
	
	@PostMapping(value = "/reply",produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Ham_OneononeVO reply(Ham_OneononeVO ham_OneononeVO,Model model) {			
		System.out.println("브이오:"+ham_OneononeVO);
		Ham_OneononeVO vo = ham_OneononeService.selectGetOne(ham_OneononeVO);
		System.out.println("브이오:"+vo);
		return vo;
	}
}
