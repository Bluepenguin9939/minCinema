package com.kh.minCinema.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.minCinema.domain.Jo_CouponVO;
import com.kh.minCinema.domain.Jo_EventRewardVO;
import com.kh.minCinema.mapper.Jo_CouponMapper;
import com.kh.minCinema.mapper.Jo_EventRewardMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class Jo_EventRewardServiceImpl implements Jo_EventRewardService {

	@Autowired
	private Jo_EventRewardMapper eventRewardMapper;
	
	@Autowired
	private Jo_CouponMapper couponMapper;
	
	@Override
	public List<Integer> checkReceive(Jo_EventRewardVO eventRewardVO) {
		int allCount = (eventRewardVO.getAllCount() / 10);
		List<Integer> discountList = new ArrayList<Integer>();
		for (int i = 1; i <= allCount; i++) {
			eventRewardVO.setR_history(String.valueOf(i));
			int count = eventRewardMapper.checkReceive(eventRewardVO);
			discountList.add(count);
		}
		log.info("disList : " + discountList);
		return discountList;
	}

	@Override
	@Transactional
	public int getReceive(Jo_EventRewardVO eventRewardVO) {
		int allCount = (eventRewardVO.getAllCount() / 10);
		int count = 0;
		for (int i = 1; i <= allCount; i++) {
			Jo_CouponVO couponVO = Jo_CouponVO.builder()
					.mid(eventRewardVO.getMid()).discount((i * 5))
					.build();
			eventRewardVO.setR_history(String.valueOf(i));
			int checkCount = eventRewardMapper.checkReceive(eventRewardVO);
			if (checkCount == 0) {
				count += eventRewardMapper.insertReceive(eventRewardVO);
				couponMapper.insertCoupon(couponVO);
			}
		}
		return count;
	}

}
