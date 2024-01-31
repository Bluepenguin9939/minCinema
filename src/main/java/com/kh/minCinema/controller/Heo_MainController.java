package com.kh.minCinema.controller;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.minCinema.domain.Jo_AttachVO;
import com.kh.minCinema.domain.Jo_MovieVO;
import com.kh.minCinema.service.Jo_AttachService;
import com.kh.minCinema.service.Jo_MovieService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/main")
@Log4j
public class Heo_MainController {
	
	@Autowired
	private Jo_MovieService movieService;
	
	@Autowired
	private Jo_AttachService attachService;
	
	@SuppressWarnings("unchecked")
	@GetMapping("/heo_details")
	public void details(@Param("detail_mov_code") String detail_mov_code,
						Model model) {
		System.out.println("detail_mov_code : " + detail_mov_code);
		attachService.getMoviePoster();
		Map<String, Object> map = movieService.getMovieByCode(detail_mov_code);
		Jo_MovieVO movieVO = (Jo_MovieVO)map.get("movieVO");
		List<Jo_AttachVO> attachList = (List<Jo_AttachVO>)map.get("attachList");
		log.info("attachList : " + attachList);
		model.addAttribute("movieDetail", movieVO);
		model.addAttribute("movieImage", attachList);
	}
	
	@GetMapping("/heo_pointCharge")
	public void pointCharge() {
		
	}
}
