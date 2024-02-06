package com.kh.minCinema.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.minCinema.domain.Heo_PointVO;
import com.kh.minCinema.domain.Je_InsertResSeatDTO;
import com.kh.minCinema.domain.Je_MovieDateInfoDTO;
import com.kh.minCinema.domain.Je_ReservationInfoVO;
import com.kh.minCinema.domain.Jo_CouponVO;
import com.kh.minCinema.mapper.Heo_MemberMapper;
import com.kh.minCinema.mapper.Heo_PointMapper;
import com.kh.minCinema.mapper.Je_MovieDateMapper;
import com.kh.minCinema.mapper.Je_MovieTheaterMapper;
import com.kh.minCinema.mapper.Jo_CouponMapper;

import lombok.extern.log4j.Log4j;


@Log4j
@Service
public class Je_MovieDateServiceImpl implements Je_MovieDateService {
	
	@Autowired
	private Je_MovieDateMapper je_MovieDateMapper;
	
	@Autowired 
	private Je_MovieTheaterMapper je_MovieTheaterMapper;
	
	@Autowired
	private Heo_PointMapper heo_PointMapper;
	
	@Autowired
	private Heo_MemberMapper heo_MemberMapper;
	
	@Autowired
	private Jo_CouponMapper couponMapper;
	
	@Override//by Je 추가
	public List<Je_MovieDateInfoDTO> getMovieTitleAndCode() {
		List<Je_MovieDateInfoDTO> list = je_MovieDateMapper.selectTitleAndCode();
		return list;
	}
	
	
	
	@Override
	public List<String> movieScreenDates(String movieCode) {
		
		List<String> list = je_MovieDateMapper.movieScreenDates(movieCode);
		
		return list;
	}

	

	@Override
	public List<Je_MovieDateInfoDTO> movieStartTimes(Je_MovieDateInfoDTO je_MovieDateInfoDTO) {

		List<Je_MovieDateInfoDTO> list = je_MovieDateMapper.movieStartTimes(je_MovieDateInfoDTO);
		log.info("@>>"+list);
		return list;
	}

	
	@Override
	public List<String> movieReservedSeats(Je_MovieDateInfoDTO je_MovieDateInfoDTO) {

		List<String> list = je_MovieTheaterMapper.movieReservedSeats(je_MovieDateInfoDTO);
		
		return list;
	}



	@Override
	@Transactional
	public int insertReservedSeats(Je_ReservationInfoVO je_ReservationInfoVO) {
		List<String> reservedSeats = je_ReservationInfoVO.getReservedSeat();
		String mid = je_ReservationInfoVO.getMid();
		int count = 0;
		
		for(String reservedSeat : reservedSeats) {
			
			Je_InsertResSeatDTO je_InsertResSeatDTO = Je_InsertResSeatDTO.builder()
					.movieTheater(je_ReservationInfoVO.getMovieTheater())
					.movieDate(je_ReservationInfoVO.getMovieDate())
					.movieTime(je_ReservationInfoVO.getMovieTime())
					.reservedSeat(reservedSeat)
					.build();
			count = je_MovieTheaterMapper.dupCheck(je_InsertResSeatDTO);
			
			if(count != 0) {
				return 0;
			}
		}
		
		
		for(String reservedSeat : reservedSeats) {
			
			Je_InsertResSeatDTO je_InsertResSeatDTO = Je_InsertResSeatDTO.builder()
					.movieTheater(je_ReservationInfoVO.getMovieTheater())
					.movieDate(je_ReservationInfoVO.getMovieDate())
					.movieTime(je_ReservationInfoVO.getMovieTime())
					.mid(je_ReservationInfoVO.getMid())
					.reservedSeat(reservedSeat)
					.build();
			count = je_MovieTheaterMapper.insertReservedSeats(je_InsertResSeatDTO);
			log.info("@count:"+count);
		}
		
		Jo_CouponVO couponVO = Jo_CouponVO.builder()
				.mid(je_ReservationInfoVO.getMid())
				.discount(je_ReservationInfoVO.getDiscount())
				.build();
		couponMapper.deleteCoupon(couponVO);
		
		Heo_PointVO heo_PointVO = Heo_PointVO.builder()
				.mid(mid).ppoint(je_ReservationInfoVO.getPayCost()).pcode("PU")
				.build();
		heo_PointMapper.insertPoint(heo_PointVO);
		
		heo_MemberMapper.updatePoint(heo_PointVO);
		
		return count;
	}

}
