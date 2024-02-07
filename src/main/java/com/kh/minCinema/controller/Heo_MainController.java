package com.kh.minCinema.controller;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.minCinema.domain.Jo_AttachVO;
import com.kh.minCinema.domain.Jo_MovieVO;
import com.kh.minCinema.domain.Jo_ReviewVO;
import com.kh.minCinema.service.Jo_AttachService;
import com.kh.minCinema.service.Jo_MovieService;
import com.kh.minCinema.service.Jo_ReviewService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/main")
@Log4j
public class Heo_MainController {
	
	@Autowired
	private Jo_MovieService movieService;
	
	@Autowired
	private Jo_AttachService attachService;
	
	@Autowired
	private Jo_ReviewService reviewService;
	
	@SuppressWarnings("unchecked")
	@GetMapping("/heo_details")
	public void details(@Param("detail_mov_code") String detail_mov_code,
						Model model) {
		attachService.getMoviePoster();
		Map<String, Object> map = movieService.getMovieByCode(detail_mov_code);
		Jo_MovieVO movieVO = (Jo_MovieVO)map.get("movieVO");
		List<Jo_AttachVO> attachList = (List<Jo_AttachVO>)map.get("attachList");
		log.info("attachList : " + attachList);
		List<Jo_ReviewVO> reviewList = reviewService.getReview(detail_mov_code);
		model.addAttribute("movieDetail", movieVO);
		model.addAttribute("movieImage", attachList);
		model.addAttribute("reviewList", reviewList);
	}
	
	@GetMapping("/heo_pointCharge")
	public void pointCharge() {
		
	}
	
	@PostMapping(value = "/writeReview",
			produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public boolean writeReview(Jo_ReviewVO reviewVO) {
		log.info(reviewVO);
		if (reviewVO.getMid().equals("") || reviewVO.getMid().equals(null)) {
			return false;
		}
		boolean result = reviewService.writeReview(reviewVO);
		return result;
	}
}
