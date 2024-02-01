package com.kh.minCinema.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.minCinema.domain.Jo_CouponVO;
import com.kh.minCinema.mapper.Jo_CouponMapper;

@Service
public class Jo_CouponServiceImpl implements Jo_CouponService {

	@Autowired
	private Jo_CouponMapper couponMapper;
	
	@Override
	public int getCouponCount(Jo_CouponVO couponVO) {
		int couponCount = couponMapper.selectCouponCount(couponVO);
		return couponCount;
	}

	@Override
	public int getAllCoupon(String mid) {
		int allCoupon = couponMapper.selectAllCoupon(mid);
		return allCoupon;
	}

}
