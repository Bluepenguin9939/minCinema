package com.kh.minCinema.controller;

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

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/ticketing")
@Log4j
public class Je_movie_reservationController {
	
	
	
	@GetMapping("/booking")
	public void booking() {
		
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
