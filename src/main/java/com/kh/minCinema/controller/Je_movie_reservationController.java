package com.kh.minCinema.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.minCinema.domain.Je_MovieReservDTO;
import com.kh.minCinema.domain.Je_ReservationInfoVO;
import com.kh.minCinema.domain.Jo_MovieVO;
import com.kh.minCinema.service.Je_MovieDateService;
import com.kh.minCinema.service.Jo_MovieService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/ticketing")
@Log4j
public class Je_movie_reservationController {
	
	@Autowired
	private Je_MovieDateService je_MovieDateService;
	
	@Autowired 
	private Jo_MovieService jo_MovieService;
	
	@GetMapping("/booking")
	public void booking() {
		
	}
	
	@PostMapping(value = "/movieList",  produces = {MediaType.APPLICATION_JSON_VALUE})
	@ResponseBody
	public List<Je_MovieReservDTO> movie_list() {
		//영화리스트 구하기
		List<Je_MovieReservDTO> list = jo_MovieService.getMovieTitleAndCode();
		
		return list;
	}
	
	
	@PostMapping(value = "/date",  produces = {MediaType.APPLICATION_JSON_VALUE})
	@ResponseBody
	public List<String> movie_date(String movieCode) {
		
		List<String> dateList = je_MovieDateService.movieScreenDates(movieCode);
		
		//log.info(">>>>>>>>> "+dateList);
		return dateList;
	}
	
	
	@PostMapping(value = "/time",  produces = {MediaType.APPLICATION_JSON_VALUE})
	@ResponseBody
	public List<Je_MovieReservDTO> movie_time(Je_MovieReservDTO je_MovieReservDTO) {
		
		//log.info("mov_date>>>>>>>>>>"+je_MovieReservDTO);
		//log.info("mov_code>>>>>>>>>>"+mov_code);
		
		String mov_date_code = je_MovieDateService.selectMovieDateCode(je_MovieReservDTO);
		if(mov_date_code == null) {
			return null;
		}
		//log.info("mov_date_code>>>>>>>>>>"+mov_date_code);
		
		List<Je_MovieReservDTO> list = je_MovieDateService.movieStartTimes(mov_date_code);
		
		//log.info("list>>>>>>>>>>"+list);
		
		return list;
	}
	

	@GetMapping("/seat")
	public void seat(Je_ReservationInfoVO je_ReservationInfoVO, Model model) {
		model.addAttribute("Je_ReservationInfoVO", je_ReservationInfoVO);

	}
	
	@PostMapping(value = "/reservedSeats" ,  produces = {MediaType.APPLICATION_JSON_VALUE})
	@ResponseBody
	public List<String> reservedSeats(Je_MovieReservDTO je_MovieReservDTO) {
		
		log.info("@>>>>>:"+je_MovieReservDTO);
		List<String> list = je_MovieDateService.movieReservedSeats(je_MovieReservDTO);
		
		return list;
	}
	
	@PostMapping(value = "/cost", consumes = {MediaType.APPLICATION_JSON_VALUE})
	@ResponseBody
	public String cost(@RequestBody Je_ReservationInfoVO je_ReservationInfoVO) {
		//log.info("cost...");
		log.info(">>>>>>>>>>>>>>>>>>"+je_ReservationInfoVO);
		log.info(">>>>>>>>>>>>>>>>>>"+je_ReservationInfoVO.getAge());
		log.info(">>>>>>>>>>>>>>>>>>"+je_ReservationInfoVO.getReservedSeat());
		
		return "true";
	}
}
