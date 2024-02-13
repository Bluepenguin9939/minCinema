package com.kh.minCinema.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.minCinema.domain.Jo_MoviePosterDTO;
import com.kh.minCinema.domain.Jo_MovieVO;
import com.kh.minCinema.service.Jo_MovieService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin")
@Log4j
public class Jo_AdminController {
	
	@Autowired
	private Jo_MovieService movieService;
	
	@PostMapping("/addMovie")
	public String addMovie(Jo_MovieVO movieVO, Jo_MoviePosterDTO posterDTO, RedirectAttributes rttr) {
		movieVO.setPosterDTO(posterDTO);
		String trailer = movieVO.getMov_trailer();
		String mov_trailer = trailer.replace("/v/", "/embed/") + "?autoPlay=true";
		
		movieVO.setMov_trailer(mov_trailer);
		boolean addResult = movieService.addMovie(movieVO);
		rttr.addFlashAttribute("addResult", addResult);
		return "redirect:/admin/ham_addmovie";
	}
}
