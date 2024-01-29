package com.kh.minCinema.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.minCinema.domain.Jo_MovieVO;
import com.kh.minCinema.service.Jo_MovieService;

@Controller
@RequestMapping("/admin")
public class Jo_AdminController {
	
	@Autowired
	private Jo_MovieService movieService;
	
	@PostMapping("/addMovie")
	public String addMovie(Jo_MovieVO movieVO, RedirectAttributes rttr) {
		System.out.println("movieVO : " + movieVO);
		boolean addResult = movieService.addMovie(movieVO);
		rttr.addFlashAttribute("addResult", addResult);
		return "redirect:/admin/ham_addmovie";
	}
}
