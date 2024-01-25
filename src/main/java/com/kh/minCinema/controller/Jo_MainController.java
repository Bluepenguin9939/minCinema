package com.kh.minCinema.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.minCinema.domain.Jo_EventDTO;
import com.kh.minCinema.service.Jo_EventService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/main")
@Log4j
public class Jo_MainController {
	
	@Autowired
	private Jo_EventService eventService;
	
	@GetMapping("/test")
	public void test() {
		// jo_main.jsp
		// jo_main2.jsp
	}
	
	@GetMapping("/jo_main")
	public void main() {
		// jo_main.jsp
		// jo_main2.jsp
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
	
	@PostMapping("/event/jan_attendance_check")
	@ResponseBody
	public void post_jan_attendance_check(String mid, RedirectAttributes rttr) {
		boolean attendanceResult = eventService.clickToAttendance(mid);
		log.info("attendanceResult : " + attendanceResult);
		rttr.addFlashAttribute("attendanceResult", attendanceResult);
//		return "redirect:/event/jan_attendance_check";
	}
}
