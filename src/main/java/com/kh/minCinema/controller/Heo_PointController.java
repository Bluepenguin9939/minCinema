package com.kh.minCinema.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.minCinema.domain.Heo_MemberVO;
import com.kh.minCinema.domain.Heo_PointCriteria;
import com.kh.minCinema.domain.Heo_PointPageDTO;
import com.kh.minCinema.domain.Heo_PointVO;
import com.kh.minCinema.service.Heo_PointService;



@Controller
@RequestMapping("/point")
public class Heo_PointController {

	@Autowired
	private Heo_PointService heo_PointService;
	
	@PostMapping("/charge")
	@ResponseBody
	public String pointCharge(Heo_PointVO heo_PointVO, HttpSession session) {
		Heo_MemberVO loginInfo = (Heo_MemberVO)session.getAttribute("loginInfo");
		boolean result = heo_PointService.pointCharge(heo_PointVO);
		if (result) {
			int bPoint = loginInfo.getMpoint();
			int aPoint = heo_PointVO.getPpoint();
			loginInfo.setMpoint(bPoint + aPoint);
			session.setAttribute("loginInfo", loginInfo);			
		}
		return String.valueOf(result);
	}
	
	@GetMapping("/pointList")
	public String getPointList(String mid, Model model, @ModelAttribute("heo_PointCriteria") Heo_PointCriteria heo_PointCriteria) {
		
		heo_PointCriteria.setMid(mid);
		List<Heo_PointVO> list = heo_PointService.getList(heo_PointCriteria);
		int total = heo_PointService.getCount(mid);
		Heo_PointPageDTO heo_PointPageDTO = new Heo_PointPageDTO(heo_PointCriteria, total);
		
			
		
		model.addAttribute("pointInfoList", list);
		model.addAttribute("pageMaker", heo_PointPageDTO);
		return "myPage/heo_pointList";
	}
	
}
