package com.kh.minCinema.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.minCinema.domain.Heo_MemberVO;
import com.kh.minCinema.domain.Jo_AttachVO;
import com.kh.minCinema.mapper.Jo_AttachMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class Jo_AttachServiceImpl implements Jo_AttachService {

	@Autowired
	private Jo_AttachMapper attachMapper;
	
	@Override
	public boolean addFile(Jo_AttachVO attachVO) {
		int count = attachMapper.insertFile(attachVO);
		if (count == 1) {
			return true;
		}
		return false;
	}

	@Override
	public Heo_MemberVO getFile(String mid) {
		Heo_MemberVO memberVO = attachMapper.selectFile(mid);
		return memberVO;
	}

	@Override
	public boolean checkProfileImage(String mid) {
		int count = attachMapper.checkProfileImage(mid);
		if (count == 1) {
			return true;
		}
		return false;
	}

	@Override
	@Transactional
	public Map<String, Object> changeFile(Jo_AttachVO attachVO) {
		Jo_AttachVO jo_AttachVO = attachMapper.selectDeleteUuid(attachVO.getMid());
		Map<String, Object> map = new HashMap<>();
		String upload_path = jo_AttachVO.getUpload_path();
		String uuid = jo_AttachVO.getUuid();
		String file_name = jo_AttachVO.getFile_name();
		
		String file_path = upload_path + "/" + uuid + "_" + file_name;
		map.put("file_path", file_path);
		boolean result = false;
		if (jo_AttachVO != null) {
			int count1 = attachMapper.deleteFile(jo_AttachVO.getUuid());
			log.info("count1 : " + count1);
			int count2 = attachMapper.insertFile(attachVO);
			log.info("count2 : " + count2);
			if (count1 + count2 == 2) {
				result = true;
			}
		}
		map.put("changeResult", result);
		return map;
	}

	@Override
	public List<Jo_AttachVO> getMoviePoster() {
		List<Jo_AttachVO> attachVO = attachMapper.selectMoviePoster();
		return attachVO;
	}

	@Override
	public List<Jo_AttachVO> getSlideMoviePoster() {
		List<Jo_AttachVO> attachList = attachMapper.selectSlideMoviePoster();
		return attachList;
	}

}
