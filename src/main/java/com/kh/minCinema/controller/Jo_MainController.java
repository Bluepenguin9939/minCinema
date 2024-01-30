package com.kh.minCinema.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.minCinema.domain.Heo_MemberVO;
import com.kh.minCinema.domain.Jo_AttachVO;
import com.kh.minCinema.domain.Jo_EventDTO;
import com.kh.minCinema.domain.Jo_MovieVO;
import com.kh.minCinema.service.Jo_AttachService;
import com.kh.minCinema.service.Jo_EventService;
import com.kh.minCinema.service.Jo_HeartService;
import com.kh.minCinema.service.Jo_MovieService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/main")
@Log4j
public class Jo_MainController {
	
	@Autowired
	private Jo_EventService eventService;
	
	@Autowired
	private Jo_MovieService movieService;
	
	@Autowired
	private Jo_HeartService heartService;
	
	@Autowired
	private Jo_AttachService attachService;
	
	@GetMapping("/test")
	public void test() {
		
	}
	
	@GetMapping("/jo_main")
	public void main(Model model, HttpSession session) {
		List<Jo_MovieVO> movieList = movieService.getAll();
		Jo_AttachVO attachVO = attachService.getMoviePoster();
		for (int i = 0; i < movieList.size(); i++) {
			Jo_MovieVO movieVO = movieList.get(i);
			if (movieVO.getMov_code().equals(attachVO.getMov_code())) {
				movieVO.setAttachVO(attachVO);
			}
		}
		log.info("movieList : " + movieList);
		Heo_MemberVO memberVO = (Heo_MemberVO)session.getAttribute("loginInfo");
		if (memberVO != null) {
			String mid = memberVO.getMid();
			String[] arrHeart = heartService.checkHeart(mid);
			String heartMovies = Arrays.toString(arrHeart);
			log.info("heartMovies : " + heartMovies.substring(1, (heartMovies.length() - 1)));
			model.addAttribute("heartMovies", heartMovies.substring(1, (heartMovies.length() - 1)));
		}
		model.addAttribute("movieList", movieList);
	}
	
	@GetMapping("/jo_loadMap")
	public void loadMap() {
		
	}
	
	@GetMapping("/jo_event")
	public void event() {
		
	}
	
	@GetMapping("/event/jo_jan_attendance_check")
	public void jan_attendance_check() {
		
	}
	
	@PostMapping(value = "/event/jan_attendance_status",
				 produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Map<String, Object> post_jan_attendance_status(Jo_EventDTO eventDTO) {
		Map<String, Object> map = eventService.checkAttendance(eventDTO);
		return map;
	}
	
	@PostMapping(value = "/event/jan_attendance_check",
				 produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public boolean post_jan_attendance_check(String mid) {
		boolean attendanceResult = eventService.clickToAttendance(mid);
		return attendanceResult;
	}
}
