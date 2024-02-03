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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.minCinema.domain.Heo_MemberVO;
import com.kh.minCinema.domain.Jo_AttachVO;
import com.kh.minCinema.domain.Jo_EventDTO;
import com.kh.minCinema.domain.Jo_EventRewardVO;
import com.kh.minCinema.domain.Jo_MovieVO;
import com.kh.minCinema.service.Jo_AttachService;
import com.kh.minCinema.service.Jo_EventRewardService;
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
	
	@Autowired
	private Jo_EventRewardService eventRewardService;
	
	@GetMapping("/test")
	public void test() {
		
	}
	
	@GetMapping("/jo_main")
	public void main(Model model, HttpSession session, String mov_genre) {
		log.info("asd :" + mov_genre);
		if (mov_genre == null) {
			mov_genre = "";
		}
		List<Jo_MovieVO> movieList = movieService.getAll(mov_genre);
		List<Jo_MovieVO> slideList = movieService.getSlideMovie();
		List<Jo_AttachVO> attachList = attachService.getMoviePoster();
		for (int i = 0; i < movieList.size(); i++) {
			Jo_MovieVO movieVO = movieList.get(i);
			for (int j = 0; j < attachList.size(); j++) {
				Jo_AttachVO attachVO = attachList.get(j);
				if (movieVO.getMov_code().equals(attachVO.getMov_code())) {
					movieVO.setAttachVO(attachVO);
				}
			}
		}
		Heo_MemberVO memberVO = (Heo_MemberVO)session.getAttribute("loginInfo");
		if (memberVO != null) {
			String mid = memberVO.getMid();
			String[] arrHeart = heartService.checkHeart(mid);
			String heartMovies = Arrays.toString(arrHeart);
			model.addAttribute("heartMovies", heartMovies.substring(1, (heartMovies.length() - 1)));
		}
		model.addAttribute("movieList", movieList);
		model.addAttribute("slideList", slideList);
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
	
	@GetMapping("/event/jo_feb_attendance_check")
	public void feb_attendance_check() {
		
	}
	
	@PostMapping(value = "/event/attendance_status",
				 produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Map<String, Object> post_jan_attendance_status(Jo_EventDTO eventDTO) {
		Map<String, Object> map = eventService.checkAttendance(eventDTO);
		return map;
	}
	
	@PostMapping(value = "/event/attendance_check",
				 produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public boolean post_jan_attendance_check(String mid) {
		boolean attendanceResult = eventService.clickToAttendance(mid);
		return attendanceResult;
	}
	
	@PostMapping(value = "/event/attendance_reward",
				 produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<Integer> attendance_reward(Jo_EventRewardVO eventRewardVO, HttpSession session) {
		log.info("REWARDeventRewardVO : " + eventRewardVO);
		Heo_MemberVO heo_MemberVO = (Heo_MemberVO)session.getAttribute("loginInfo");
		String mid = heo_MemberVO.getMid();
		eventRewardVO.setMid(mid);
		List<Integer> discountList = eventRewardService.checkReceive(eventRewardVO);
		return discountList;
	}
	
	@PostMapping("/event/attendance_receive")
	@ResponseBody
	public boolean attendance_receive(Jo_EventRewardVO eventRewardVO, HttpSession session) {
		log.info("RECEIVEeventRewardVO : " + eventRewardVO);		
		Heo_MemberVO heo_MemberVO = (Heo_MemberVO)session.getAttribute("loginInfo");
		String mid = heo_MemberVO.getMid();
		int couponCount = heo_MemberVO.getCoupon();
		eventRewardVO.setMid(mid);
		int count = eventRewardService.getReceive(eventRewardVO);
		boolean result = false;
		if (count != 0) {
			couponCount =  couponCount + count;
			heo_MemberVO.setCoupon(couponCount);
			session.setAttribute("loginInfo", heo_MemberVO);
			result = true;
		}
		return result;
	}
}
