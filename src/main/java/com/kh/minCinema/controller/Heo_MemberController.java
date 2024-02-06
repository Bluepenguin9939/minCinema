package com.kh.minCinema.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.minCinema.domain.Heo_LoginDTO;
import com.kh.minCinema.domain.Heo_MemberVO;
import com.kh.minCinema.domain.Jo_CouponVO;
import com.kh.minCinema.service.Heo_MemberService;
import com.kh.minCinema.service.Jo_AttachService;
import com.kh.minCinema.service.Jo_CouponService;

@Controller
@RequestMapping("/member")
public class Heo_MemberController {

	@Autowired
	private Heo_MemberService heo_MemberService;
//	@Autowired
//	private Heo_PointService heo_PointService;
	
	@Autowired
	private Jo_AttachService attachService;
	
	@Autowired
	private Jo_CouponService couponService;
	
	@PostMapping("/register")
	public String register(Heo_MemberVO heo_MemberVO) {
		System.out.println("컨트롤러" + heo_MemberVO);
		heo_MemberService.register(heo_MemberVO);
		return "redirect:/member/jo_login";
	}
	
	@PostMapping("/updateBen")
	@ResponseBody
	public boolean updateBen(Heo_MemberVO heo_MemberVO) {
		int result = heo_MemberService.updateBen(heo_MemberVO);
		return (result != 1)? true : false;
	}
	
	@PostMapping("/login")
	public void login(Model model, Heo_LoginDTO heo_LoginDTO) {
		Heo_MemberVO heo_MemberVO = heo_MemberService.memberLogin(heo_LoginDTO);
		if (heo_MemberVO == null) {
			return;
		}
		
		int coupon5 = 0;
		int coupon10 = 0;
		int coupon15 = 0;
		
		for (int i = 5; i <= 15; i += 5) {
			Jo_CouponVO couponVO = Jo_CouponVO.builder()
					.mid(heo_MemberVO.getMid()).discount(i)
					.build();
			int discountCoupon = couponService.getCouponCount(couponVO);
			if (i == 5) {
				coupon5 = discountCoupon;
			} else if (i == 10) {
				coupon10 = discountCoupon;
			} else if (i == 15) {
				coupon15 = discountCoupon;
			}
		}
		if (coupon5 != 0) {
			heo_MemberVO.setCoupon5(coupon5);
		}
		if (coupon10 != 0) {
			heo_MemberVO.setCoupon10(coupon10);
		}
		if (coupon15 != 0) {
			heo_MemberVO.setCoupon15(coupon15);
		}
		Heo_MemberVO memberVO = attachService.getFile(heo_MemberVO.getMid());
		if (memberVO != null) {
			memberVO.setCoupon5(coupon5);
			memberVO.setCoupon10(coupon10);
			memberVO.setCoupon15(coupon15);
			model.addAttribute("loginInfo", memberVO);
		} else {
			model.addAttribute("loginInfo", heo_MemberVO);
		}
		model.addAttribute("useCookie", heo_LoginDTO.getUseCookie());
	}
	
}
