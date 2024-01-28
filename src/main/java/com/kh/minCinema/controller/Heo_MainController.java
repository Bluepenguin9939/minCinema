package com.kh.minCinema.controller;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.minCinema.domain.Jo_MovieVO;
import com.kh.minCinema.service.Jo_MovieService;

@Controller
@RequestMapping("/main")
public class Heo_MainController {
	
	@Autowired
	private Jo_MovieService movieService;
	
	@GetMapping("/heo_details")
	public void details(@Param("detail_mov_code") String detail_mov_code,
						Model model) {
		System.out.println("detail_mov_code : " + detail_mov_code);
		Jo_MovieVO movieVO = movieService.getMovieByCode(detail_mov_code);
		model.addAttribute("movieDetail", movieVO);
	}
	
	@GetMapping("/heo_pointCharge")
	public void pointCharge() {
		
	}
}
