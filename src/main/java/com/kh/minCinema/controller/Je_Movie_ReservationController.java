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

import com.kh.minCinema.domain.Je_MovieDateInfoDTO;
import com.kh.minCinema.domain.Je_ReservationInfoVO;
import com.kh.minCinema.domain.Jo_MovieVO;
import com.kh.minCinema.service.Je_MovieDateService;
import com.kh.minCinema.service.Jo_MovieService;

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
		
		//log.info(">>>>>>>>> "+dateList);
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
		
		log.info("@>>>>>:"+je_MovieDateInfoDTO);
		List<String> list = je_MovieDateService.movieReservedSeats(je_MovieDateInfoDTO);
		
		return list;
	}
	
	@PostMapping(value = "/cost", consumes = {MediaType.APPLICATION_JSON_VALUE})
	@ResponseBody
	public String cost(@RequestBody Je_ReservationInfoVO je_ReservationInfoVO) {
		//log.info("cost...");
		log.info(">>>>>>>>>>>>>>>>>>"+je_ReservationInfoVO);
		//log.info(">>>>>>>>>>>>>>>>>>"+je_ReservationInfoVO.getAge());
		//log.info(">>>>>>>>>>>>>>>>>>"+je_ReservationInfoVO.getReservedSeat());
		
		int count = je_MovieDateService.insertReservedSeats(je_ReservationInfoVO);
		
		//log.info("count:"+count);
		
		if(count==1) {
			return "true";
		}
		else {
			return "false";
		}
		
	}
}