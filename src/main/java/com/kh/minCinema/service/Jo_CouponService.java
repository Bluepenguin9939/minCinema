package com.kh.minCinema.service;

import com.kh.minCinema.domain.Jo_CouponVO;

public interface Jo_CouponService {
	
	public int getCouponCount(Jo_CouponVO couponVO);
	
	public int getAllCoupon(String mid);
}
