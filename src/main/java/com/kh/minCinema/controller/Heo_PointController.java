package com.kh.minCinema.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.minCinema.domain.Heo_MemberVO;
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
		System.out.println("컨트롤 포차 : " + heo_PointVO);
		boolean result = heo_PointService.pointCharge(heo_PointVO);
		if (result) {
			int bPoint = loginInfo.getMpoint();
			int aPoint = heo_PointVO.getPpoint();
			loginInfo.setMpoint(bPoint + aPoint);
			session.setAttribute("loginInfo", loginInfo);			
		}
		return String.valueOf(result);
	}
	
}
