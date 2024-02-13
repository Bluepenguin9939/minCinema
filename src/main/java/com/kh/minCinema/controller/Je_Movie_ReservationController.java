package com.kh.minCinema.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.minCinema.domain.Heo_MemberVO;
import com.kh.minCinema.domain.Je_MovieDateInfoDTO;
import com.kh.minCinema.domain.Je_ReservationInfoVO;
import com.kh.minCinema.domain.Jo_CouponVO;
import com.kh.minCinema.mapper.Jo_CouponMapper;
import com.kh.minCinema.service.Je_MovieDateService;
import com.kh.minCinema.service.Jo_CouponService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/ticketing")
@Log4j
public class Je_Movie_ReservationController {
	
	@Autowired
	private Je_MovieDateService je_MovieDateService;
	
	@GetMapping("/booking")
	public void booking() {
		
	}
	
	@PostMapping(value = "/movieList",  produces = {MediaType.APPLICATION_JSON_VALUE})
	@ResponseBody
	public List<Je_MovieDateInfoDTO> movie_list() {
		//영화리스트 구하기
		List<Je_MovieDateInfoDTO> list = je_MovieDateService.getMovieTitleAndCode();
		
		return list;
	}
	
	
	@PostMapping(value = "/date",  produces = {MediaType.APPLICATION_JSON_VALUE})
	@ResponseBody
	public List<String> movie_date(String mov_code) {
		
		List<String> dateList = je_MovieDateService.movieScreenDates(mov_code);
		
		return dateList;
	}
	
	
	@PostMapping(value = "/time",  produces = {MediaType.APPLICATION_JSON_VALUE})
	@ResponseBody
	public List<Je_MovieDateInfoDTO> movie_time(Je_MovieDateInfoDTO je_MovieDateInfoDTO) {
		
		
		List<Je_MovieDateInfoDTO> list = je_MovieDateService.movieStartTimes(je_MovieDateInfoDTO);
		
		
		return list;
	}
	

	@GetMapping("/seat")
	public void seat(Je_ReservationInfoVO je_ReservationInfoVO, Model model) {
		model.addAttribute("Je_ReservationInfoVO", je_ReservationInfoVO);

	}
	
	
	@PostMapping(value = "/reservedSeats" ,  produces = {MediaType.APPLICATION_JSON_VALUE})
	@ResponseBody
	public List<String> reservedSeats(Je_MovieDateInfoDTO je_MovieDateInfoDTO) {
		
		List<String> list = je_MovieDateService.movieReservedSeats(je_MovieDateInfoDTO);
		
		return list;
	}
	
	@PostMapping(value = "/cost", consumes = {MediaType.APPLICATION_JSON_VALUE})
	@ResponseBody
	public String cost(@RequestBody Je_ReservationInfoVO je_ReservationInfoVO, HttpSession session) {
		
		Heo_MemberVO memberVO = (Heo_MemberVO)session.getAttribute("loginInfo");
		
		int count = je_MovieDateService.insertReservedSeats(je_ReservationInfoVO);
		
		if(count==1) {
			int discount = je_ReservationInfoVO.getDiscount();
			if (discount == 5) {
				int coupon5 = memberVO.getCoupon5();
				coupon5--;
				memberVO.setCoupon5(coupon5);
			} else if (discount == 10) {
				int coupon10 = memberVO.getCoupon10();
				coupon10--;
				memberVO.setCoupon10(coupon10);
			} else if (discount == 15) {
				int coupon15 = memberVO.getCoupon15();
				coupon15--;
				memberVO.setCoupon15(coupon15);
			}
			memberVO.setMpoint(je_ReservationInfoVO.getResultCost());
			session.setAttribute("loginInfo", memberVO);
			return "true";
		}
		else {
			return "false";
		}
		
	}
}