package com.kh.minCinema.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.minCinema.domain.Ham_MovieCountDTO;
import com.kh.minCinema.domain.Jo_AttachVO;

import com.kh.minCinema.domain.Jo_MovieVO;
import com.kh.minCinema.domain.Jo_SearchDTO;
import com.kh.minCinema.mapper.Jo_AttachMapper;
import com.kh.minCinema.mapper.Jo_MovieMapper;

import lombok.extern.log4j.Log4j;


@Service
@Log4j
public class Jo_MovieServiceImpl implements Jo_MovieService {
	
	@Autowired
	private Jo_MovieMapper movieMapper;
	
	@Autowired
	private Jo_AttachMapper attachMapper;

	@Override
	@Transactional
	public boolean addMovie(Jo_MovieVO movieVO) {
		log.info("@movieVO:"+ movieVO);
		int count = movieMapper.insertMovie(movieVO);
		int count2 = attachMapper.insertMoviePoster(movieVO.getPosterDTO());
		List<Jo_AttachVO> attachList = movieVO.getList();
		int count3 = 0;
		for (Jo_AttachVO attachVO : attachList) {
			count3 = attachMapper.insertMovieStillCut(attachVO);
		}
		log.info("count : " + count);
		log.info("count2 : " + count2);
		log.info("count3 : " + count3);
		if (count + count2 + count3 == 3) {
			return true;
		}
		return false;
	}

	@Override
	public List<Jo_MovieVO> getAll(Jo_SearchDTO searchDTO) {
		List<Jo_MovieVO> movieList = new ArrayList<>();
		if (searchDTO.getKeyword() == null || searchDTO.getKeyword() == "") {
			movieList = movieMapper.selectAll(searchDTO.getMov_genre());
		} else {
			movieList = movieMapper.selectMovieSearch(searchDTO);
		}
		return movieList;
	}

	@Override
	public Map<String, Object> getMovieByCode(String mov_code) {
		Map<String, Object> map = new HashMap<>();
		Jo_MovieVO movieVO = movieMapper.selectMovieByCode(mov_code);
		List<Jo_AttachVO> attachList = attachMapper.selectMovieImageToCode(mov_code);
		map.put("movieVO", movieVO);
		map.put("attachList", attachList);
		return map;
	}

	@Override
	public List<Jo_MovieVO> getInterestToHeart(String mid) {
		List<Jo_MovieVO> movieList = movieMapper.selectInterestToHeart(mid);
		return movieList;
	}

	@Override
	public List<Jo_MovieVO> getSlideMovie() {
		List<Jo_MovieVO> movieList = movieMapper.selectSlideMovie();
		return movieList;
	}
	

	@Override//관리자 차트
	public List<Ham_MovieCountDTO> getMovieCount() {
		List<Ham_MovieCountDTO> list = movieMapper.selectMovieCount();
		return list;
	}

	@Override //영화 삭제
	public void movieDelete(String movieCode) {
		// TODO Auto-generated method stub
		List<Jo_AttachVO> list = attachMapper.selectMovieImageToCode(movieCode);
		
		for(Jo_AttachVO jo_AttachVO:list) {
			String directoryPath = jo_AttachVO.getUpload_path();
			String filePath = directoryPath+"/"+jo_AttachVO.getFile_name();
			
			//log.info("@@"+directoryPath);
			//log.info("@@filePath:"+filePath);
			
			 File file = new File(filePath);        
			 File directory = new File(directoryPath);         // 파일 삭제        
			 boolean fileDeleted = file.delete();         // 디렉토리 삭제        
			 boolean directoryDeleted = directory.delete();         // 삭제 결과 출력        
			 //System.out.println(fileDeleted);        
			// System.out.println(directoryDeleted);
			
		}
		
		movieMapper.movieDelete(movieCode);
		
	}

}
