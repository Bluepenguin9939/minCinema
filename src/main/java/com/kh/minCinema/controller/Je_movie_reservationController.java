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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.minCinema.domain.Je_reservationVO;
import com.kh.minCinema.service.Je_MovieDateService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/ticketing")
@Log4j
public class Je_movie_reservationController {
	
	@Autowired
	private Je_MovieDateService je_MovieDateService;
	
	
	@GetMapping("/booking")
	public void booking() {
		
	}
	
	@PostMapping(value = "/date",  produces = {MediaType.APPLICATION_JSON_VALUE})
	@ResponseBody
	public List<String> movie_date(String movieCode, Model model) {
		//log.info(">>>>>>>>> "+movieCode);
		
		List<String> dateList = je_MovieDateService.movieScreenDates(movieCode);
		
		//model.addAttribute("dateList", dateList);
		
		log.info(">>>>>>>>> "+dateList);
		return dateList;
	}
	
	@PostMapping("/time")
	public void movie_time() {
		
	}
	

	@GetMapping("/seat")
	public void seat(Je_reservationVO je_reservationVO, Model model) {
		model.addAttribute("je_reservationVO", je_reservationVO);
		//log.info(">>>>>>>>>>>>>>>>"+je_reservationVO);
		//return je_reservationVO;
	}
	
	@PostMapping(value = "/cost", consumes = {MediaType.APPLICATION_JSON_VALUE})
	@ResponseBody
	public String cost(@RequestBody Je_reservationVO je_reservationVO) {
		//log.info("cost...");
		log.info(">>>>>>>>>>>>>>>>>>"+je_reservationVO);
		log.info(">>>>>>>>>>>>>>>>>>"+je_reservationVO.getAge());
		log.info(">>>>>>>>>>>>>>>>>>"+je_reservationVO.getReservedSeat());
		
		return "true";
	}
}
