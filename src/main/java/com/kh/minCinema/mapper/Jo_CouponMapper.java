package com.kh.minCinema.mapper;

import com.kh.minCinema.domain.Jo_CouponVO;

public interface Jo_CouponMapper {
	
	public Jo_CouponVO selectUseCoupon(Jo_CouponVO couponVO);
	
	public int selectCouponCount(Jo_CouponVO couponVO);
	
	public int selectAllCoupon(String mid);
}
