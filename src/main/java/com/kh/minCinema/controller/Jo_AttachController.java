package com.kh.minCinema.controller;

import java.io.File;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
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
	private static final String PROFILE_UPLOAD_PATH = "G:/upload/user_profile_image";
//	private static final String PROFILE_UPLOAD_PATH = "D:/upload/user_profile_image";
	private static final String POSTER_UPLOAD_PATH = "G:/upload/poster";
//	private static final String POSTER_UPLOAD_PATH = "D:/upload/poster";
	private static final String STILL_CUT_UPLOAD_PATH = "G:/upload/still_cut";
//	private static final String STILL_CUT_UPLOAD_PATH = "D:/upload/still_cut";

	
	@Autowired
	private Jo_AttachService attachService;
	
	@PostMapping(value = "/uploadProfileImage",
			 produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Map<String, Object> uploadProfileImage(MultipartFile uploadFile, HttpSession session) {
		Heo_MemberVO memberVO = (Heo_MemberVO)session.getAttribute("loginInfo");
		String mid = memberVO.getMid();
		if (uploadFile == null) {
			return null;
		}
		UUID uuid = UUID.randomUUID();
		String orgFileName = uploadFile.getOriginalFilename();
		String saveFileName = uuid + "_" + orgFileName;
		File saveRepository = new File(PROFILE_UPLOAD_PATH, saveFileName);
		Map<String, Object> map = new HashMap<>();
		Jo_AttachVO attachVO = Jo_AttachVO.builder()
				.uuid(uuid.toString()).upload_path(PROFILE_UPLOAD_PATH)
				.file_name(orgFileName).mid(mid)
				.build();
		boolean result = (attachVO != null) ? true : false;
		map.put("attachVO", attachVO);
		map.put("result", result);
		try {
			uploadFile.transferTo(saveRepository);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	
	@PostMapping(value = "/uploadStillCutImage",
				 produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<Jo_AttachVO> uploadStillCutImage(MultipartFile[] uploadFile) {
		if (uploadFile == null) {
			return null;
		}
		String[] movieOrgName = uploadFile[0].getOriginalFilename().split("_");
		String moviePath = STILL_CUT_UPLOAD_PATH + "/" + movieOrgName[0];
		createForder(moviePath);
		log.info("moviePath : " + moviePath);
		
		List<Jo_AttachVO> attachList = new ArrayList<>();
		for (int i = 0; i < uploadFile.length; i++) {
			String orgFileName = uploadFile[i].getOriginalFilename();
			File saveRepository = new File(moviePath, orgFileName);
			Jo_AttachVO attachVO = Jo_AttachVO.builder()
					.upload_path(moviePath).file_name(orgFileName)
					.build();
			boolean result = (attachVO != null) ? true : false;
			if (result) {
				attachList.add(attachVO);
			}
			try {
				uploadFile[i].transferTo(saveRepository);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return attachList;
	}
	
	@PostMapping(value = "/uploadPosterImage",
			produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Map<String, Object> uploadPosterImage(MultipartFile uploadFile) {
		if (uploadFile == null) {
			return null;
		}
		int movieOrgNameLength = uploadFile.getOriginalFilename().length() - 4;
		String movieOrgName = uploadFile.getOriginalFilename().substring(0, movieOrgNameLength);
		String moviePath = POSTER_UPLOAD_PATH + "/" + movieOrgName;
		createForder(moviePath);
		
		Map<String, Object> map = new HashMap<>();
		
		String orgFileName = uploadFile.getOriginalFilename();
		File saveRepository = new File(moviePath, orgFileName);
		Jo_AttachVO attachVO = Jo_AttachVO.builder()
				.upload_path(moviePath).file_name(orgFileName)
				.build();
		boolean result = (attachVO != null) ? true : false;
		map.put("attachVO", attachVO);
		map.put("result", result);
		try {
			uploadFile.transferTo(saveRepository);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	
	private void createForder(String moviePath) {
		File movieFolder = new File(moviePath);
		if (!movieFolder.exists()) {
			movieFolder.mkdirs();
		}
	}
	
	@GetMapping("/display")
	public ResponseEntity<byte[]> getFile(String fileName) {
		File target = new File(fileName);
		try {
			byte[] data = FileCopyUtils.copyToByteArray(target);
			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-Type", Files.probeContentType(target.toPath()));
			ResponseEntity<byte[]> entity = 
					new ResponseEntity<>(data, headers, HttpStatus.OK);
			return entity;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@PostMapping(value = "/changeProfile",
				 produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public boolean changeProfile(Jo_AttachVO attachVO, HttpSession session) {
		Heo_MemberVO memberVO = (Heo_MemberVO)session.getAttribute("loginInfo");
		String mid = memberVO.getMid();
		attachVO.setMid(mid);
		boolean isChecked = attachService.checkProfileImage(mid);
		if (isChecked) {
			Map<String, Object> changeMap = attachService.changeFile(attachVO);
			boolean changeResult = (boolean)changeMap.get("changeResult");
			String file_path = (String)changeMap.get("file_path");
			deleteFile(file_path);
			if (changeResult) {
				memberVO.setFile_name(attachVO.getFile_name());
				memberVO.setUuid(attachVO.getUuid());
				memberVO.setUpload_path(attachVO.getUpload_path());
				session.setAttribute("loginInfo", memberVO);
			}
			return changeResult;
		} else {
			boolean addResult = attachService.addFile(attachVO);
			if (addResult) {
				memberVO.setFile_name(attachVO.getFile_name());
				memberVO.setUuid(attachVO.getUuid());
				memberVO.setUpload_path(attachVO.getUpload_path());
				session.setAttribute("loginInfo", memberVO);
			}
			return addResult;
		}
	}
	
	@PostMapping("/deleteProfile")
	public ResponseEntity<String> deleteFile(String file_path) {
		log.info("fileName : " + file_path);
		File f = new File(file_path);
		log.info(f);
		boolean result = f.delete();
		if (result) {
			System.out.println("f : O");
		} else {
			System.out.println("f : X");
		}
		ResponseEntity<String> entity = new ResponseEntity<String>(String.valueOf(result), HttpStatus.OK);
		return entity;
	}
}
