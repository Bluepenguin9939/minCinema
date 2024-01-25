package com.kh.minCinema.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.minCinema.domain.Jo_EventDTO;
import com.kh.minCinema.service.Jo_EventService;

@Controller
@RequestMapping("/main")
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
	
	@PostMapping(value = "/event/jan_attendance_check",
				 produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Map<String, String> post_jan_attendance_check(Jo_EventDTO eventDTO) {
		Map<String, String> map = eventService.checkAttendance(eventDTO);
		return map;
	}
}
