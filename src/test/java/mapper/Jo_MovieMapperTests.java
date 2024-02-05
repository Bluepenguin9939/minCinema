package mapper;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.minCinema.domain.Jo_MovieVO;
import com.kh.minCinema.mapper.Jo_MovieMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
@WebAppConfiguration
public class Jo_MovieMapperTests {
	
	@Autowired
	private Jo_MovieMapper movieMapper;
	
	@Test
	public void testInsertMovie() {
		List<String> actorList = new ArrayList<String>();
		actorList.add("니콜라스 홀트");
		actorList.add("이완 맥그리거");
		actorList.add("엘리너 톰린슨");
		actorList.add("빌 나이");
		actorList.add("존 카저");
		actorList.add("스탠리 투치");
		log.info("actor : " + actorList);
		
		String actor = String.join(",", actorList);
		log.info("actor : " + actor);
		
		List<String> genreList = new ArrayList<String>();
		genreList.add("판타지");
		genreList.add("드라마");
		genreList.add("어드벤처");
		
		String genre = String.join(",", genreList);
		log.info("str1 : " + genre);
		
		String releaseDate = null;
		try {
			String openDt = "20130228";
			SimpleDateFormat dtFormat = new SimpleDateFormat("yyyyMMdd");
			SimpleDateFormat newDtFormat = new SimpleDateFormat("yyyy-MM-dd");
			
			Date formatDate = dtFormat.parse(openDt);
			releaseDate = newDtFormat.format(formatDate);
		} catch (Exception e) {
			e.printStackTrace();
		}
		Jo_MovieVO movieVO = Jo_MovieVO.builder()
				.mov_code("20123641").mov_title("잭 더 자이언트 킬러")
				.mov_director("브라이언 싱어")
				.mov_actor(actor).mov_releaseDate(releaseDate)
				.mov_plot("잭, 거인에 맞서라!\r\n"
						+ "하늘의 문이 열리고, 거대한 놈들이 온다!\r\n"
						+ "\r\n"
						+ "어느 세찬 비바람이 몰아치던 밤, 잭(니콜라스 홀트)은 물에 닿으면 엄청나게 자라는 마법의 콩나무에 휩쓸려 하늘과 땅 사이에 존재하는 무시무시한 거인들의 세상에 올라가게 된다. 그곳에서 잭은 인간세계를 정복하려는 거인들과 이에 맞서는 인간들의 거대한 전쟁에 합류하게 되는데...")
				.mov_runtime(114).mov_rating("12세이상관람가")
				.mov_genre(genre)
				.build();
		movieMapper.insertMovie(movieVO);
	}
	
	@Test
	public void testSelectAll() {
		List<Jo_MovieVO> movieVO = movieMapper.selectAll("");
		log.info("movieVO : " + movieVO);
	}
	
	@Test
	public void testSelectMovieByCode() {
		String mov_code = "20235253";
		Jo_MovieVO movieVO = movieMapper.selectMovieByCode(mov_code);
		log.info("movieVO : " + movieVO);
	}
	
	@Test
	public void testSelectInterestToHeart() {
		String mid = "test";
		List<Jo_MovieVO> movieList = movieMapper.selectInterestToHeart(mid);
		log.info("movieList : " + movieList);
	}
	
}
