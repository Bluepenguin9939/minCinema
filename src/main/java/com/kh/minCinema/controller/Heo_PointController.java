package com.kh.minCinema.controller;

import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import com.kh.minCinema.domain.Heo_PointListVO;
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
	
	@GetMapping("/pointList")
	public String getPointList(String mid, Model model, @ModelAttribute("heo_PointCriteria") Heo_PointCriteria heo_PointCriteria) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년MM월dd일 HH시mm분");
		NumberFormat nf = NumberFormat.getInstance();
		heo_PointCriteria.setMid(mid);
		List<Heo_PointVO> list = heo_PointService.getList(heo_PointCriteria);
		int total = heo_PointService.getCount(mid);
		Heo_PointPageDTO heo_PointPageDTO = new Heo_PointPageDTO(heo_PointCriteria, total);
		System.out.println();
		System.out.println("total " + total);
		System.out.println("cri " + heo_PointCriteria);
		System.out.println("list " + list);
		String pcode = "";
		List<Heo_PointListVO> pointInfoList = new ArrayList<>();
		for (Heo_PointVO heo_PointVO : list) {
			int point = heo_PointVO.getPpoint();
			String code = heo_PointVO.getPcode();
			if (code.equals("PC")) {
				pcode = "포인트 충전";
			} else {
				pcode = "영화 예매";
			}
			String ppoint = nf.format(point);
			Date format = heo_PointVO.getPdate();
			String pdate = sdf.format(format);
			Heo_PointListVO heo_PointListVO = new Heo_PointListVO(ppoint, pcode, pdate);
			pointInfoList.add(heo_PointListVO);
		}		
		
		model.addAttribute("pointInfoList", pointInfoList);
		System.out.println(pointInfoList);
		model.addAttribute("pageMaker", heo_PointPageDTO);
		System.out.println(heo_PointPageDTO);
		return "myPage/heo_pointList";
	}
	
}
