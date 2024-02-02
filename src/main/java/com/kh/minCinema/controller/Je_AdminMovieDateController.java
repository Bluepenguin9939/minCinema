package com.kh.minCinema.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.minCinema.domain.Jo_MoviePosterDTO;
import com.kh.minCinema.domain.Jo_MovieVO;
import com.kh.minCinema.service.Je_AdminMovieDateService;
import com.kh.minCinema.service.Jo_MovieService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin")
@Log4j
public class Je_AdminMovieDateController {
	
	@Autowired
	private Je_AdminMovieDateService je_AdminMovieDateService;
	
	@PostMapping(value = "/movieTitleLists" , produces = {MediaType.APPLICATION_JSON_VALUE})
	@ResponseBody
	public List<Jo_MovieVO> addMovie() {
		
		List<Jo_MovieVO> list = je_AdminMovieDateService.movieDataLists();
		
		
		
		return list;
	}
}
