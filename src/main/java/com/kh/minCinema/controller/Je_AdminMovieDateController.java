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

import com.kh.minCinema.domain.Je_MovieDateInfoDTO;
import com.kh.minCinema.domain.Jo_AttachVO;
import com.kh.minCinema.domain.Jo_MoviePosterDTO;
import com.kh.minCinema.domain.Jo_MovieVO;
import com.kh.minCinema.service.Je_AdminMovieDateService;
import com.kh.minCinema.service.Jo_AttachService;
import com.kh.minCinema.service.Jo_MovieService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin")
@Log4j
public class Je_AdminMovieDateController {
	
	@Autowired
	private Je_AdminMovieDateService je_AdminMovieDateService;
	
	@Autowired
	private Jo_AttachService jo_AttachService;
	
	@PostMapping(value = "/movieTitleLists" , produces = {MediaType.APPLICATION_JSON_VALUE})
	@ResponseBody
	public List<Jo_MovieVO> addMovieList() {
		
		List<Jo_MovieVO> list = je_AdminMovieDateService.movieDataLists();
		
		return list;
	}
	
	@PostMapping(value = "/movieDates" , produces = {MediaType.APPLICATION_JSON_VALUE})
	@ResponseBody
	public List<Je_MovieDateInfoDTO> movieLists(String mov_code) {
		
		List<Je_MovieDateInfoDTO> datelist = je_AdminMovieDateService.movieDates(mov_code);
		
		return datelist;
	}
	
	@PostMapping(value = "/movieImage" , produces = {MediaType.APPLICATION_JSON_VALUE})
	@ResponseBody
	public List<Jo_AttachVO> movieImage(String mov_code) {
		
		List<Jo_AttachVO> list = jo_AttachService.getMovieImage(mov_code);
		
		return list;
	}
	
	
	@PostMapping(value = "/addMovieDate") //추가
	@ResponseBody
	public String addMovieDate(Je_MovieDateInfoDTO je_MovieDateInfoDTO) {
		log.info("@@"+je_MovieDateInfoDTO);
		//List<Jo_MovieVO> list = je_AdminMovieDateService.movieDataLists();
		int count1 = je_AdminMovieDateService.dupCheck(je_MovieDateInfoDTO);
		
		if(count1 == 0) {
			int count = je_AdminMovieDateService.addDate(je_MovieDateInfoDTO);
			
			if(count == 1) {
				String dateCode = je_AdminMovieDateService.selectDateCode(je_MovieDateInfoDTO);
				return dateCode;
			}
			return "false1";
		}
		
		return "false0";
		/*int count = je_AdminMovieDateService.addDate(je_MovieDateInfoDTO);
		
		if(count == 1) {
			String dateCode = je_AdminMovieDateService.selectDateCode(je_MovieDateInfoDTO);
			return dateCode;
		}*/
	}
	
	@PostMapping(value = "/editMovieDate") //수정
	@ResponseBody
	public String editMovieDate(Je_MovieDateInfoDTO je_MovieDateInfoDTO) {
		int count1 = je_AdminMovieDateService.dupCheck(je_MovieDateInfoDTO);
		log.info("@@"+je_MovieDateInfoDTO);
		
		if(count1 == 0) {
			int count = je_AdminMovieDateService.editDate(je_MovieDateInfoDTO);
			
			if(count == 1) {
				return "true";
			}
		}
		return "false";
	}
	
	@PostMapping(value = "/removeMovieDate") //삭제
	@ResponseBody
	public String romveMovieDate(String mov_date_code) {
		//log.info("@@"+je_MovieDateInfoDTO);
		int count = je_AdminMovieDateService.remove(mov_date_code);
		
		if(count == 1) {
			return "true";
		}
		return "false";
		//return list;
	}
	
	
	
}
