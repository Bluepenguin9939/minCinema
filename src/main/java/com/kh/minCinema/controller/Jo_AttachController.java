package com.kh.minCinema.controller;

import java.io.File;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.minCinema.domain.Heo_MemberVO;
import com.kh.minCinema.domain.Jo_AttachVO;
import com.kh.minCinema.service.Jo_AttachService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class Jo_AttachController {

	@Autowired
	private Jo_AttachService attachService;
	
@PostMapping(value = "/uploadProfileImage",
		 produces = MediaType.APPLICATION_JSON_VALUE)
@ResponseBody
public Map<String, Object> uploadProfileImage(MultipartFile uploadFile, HttpSession session) {
	Heo_MemberVO memberVO = (Heo_MemberVO)session.getAttribute("loginInfo");
	String mid = memberVO.getMid();
	String uploadPath = "G:/upload/user_profile_image";
	if (uploadFile == null) {
		return null;
	}
	UUID uuid = UUID.randomUUID();
	String orgFileName = uploadFile.getOriginalFilename();
	String saveFileName = uuid + "_" + orgFileName;
	File saveRepository = new File(uploadPath, saveFileName);
	Map<String, Object> map = new HashMap<>();
	Jo_AttachVO attachVO = Jo_AttachVO.builder()
			.uuid(uuid.toString()).upload_path(uploadPath)
			.file_name(orgFileName).mid(mid)
			.build();
	boolean addResult = attachService.addFile(attachVO);
	map.put("attachVO", attachVO);
	map.put("addResult", addResult);
	try {
		uploadFile.transferTo(saveRepository);
	} catch (Exception e) {
		e.printStackTrace();
	}
	return map;
}
}
