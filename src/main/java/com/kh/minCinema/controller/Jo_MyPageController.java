package com.kh.minCinema.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.minCinema.domain.Heo_MemberVO;
import com.kh.minCinema.domain.Jo_AttachVO;
import com.kh.minCinema.domain.Jo_CouponVO;
import com.kh.minCinema.domain.Jo_MovieVO;
import com.kh.minCinema.service.Jo_AttachService;
import com.kh.minCinema.service.Jo_CouponService;
import com.kh.minCinema.service.Jo_MovieService;

@Controller
@RequestMapping("/myPage")
public class Jo_MyPageController {
	
	@Autowired
	private Jo_MovieService movieService;
	
	@Autowired
	private Jo_AttachService attachService;
	
	@Autowired
	private Jo_CouponService couponService;
	
	@GetMapping("/jo_myInfo")
	public void myPage() {
		
	}
	
	@GetMapping("/jo_myPoint")
	public void myPoint() {
		
	}
	
	@GetMapping("/jo_myInterest")
	public void myInterest(HttpSession session, Model model) {
		Heo_MemberVO memberVO = (Heo_MemberVO)session.getAttribute("loginInfo");
		String mid = memberVO.getMid();
		List<Jo_MovieVO> movieList = movieService.getInterestToHeart(mid);
		List<Jo_AttachVO> attachList = attachService.getMoviePoster();
		model.addAttribute("movieList", movieList);
		model.addAttribute("attachList", attachList);
	}
	
	@GetMapping("/jo_myCoupon")
	public void myCoupon(HttpSession session, Model model) {
		Heo_MemberVO heo_MemberVO = (Heo_MemberVO)session.getAttribute("loginInfo");
		String mid = heo_MemberVO.getMid();
//		for (int i = 5; i <= 15; i += 5) {
//			Jo_CouponVO couponVO = Jo_CouponVO.builder()
//					.mid(mid).discount(i)
//					.build();
//			int discountCoupon = couponService.getCouponCount(couponVO);
//			model.addAttribute(i + "%_coupon", discountCoupon);
//		}
	}
}
