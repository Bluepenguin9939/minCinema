package mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.minCinema.domain.Jo_HeartDTO;
import com.kh.minCinema.mapper.Jo_HeartMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
@WebAppConfiguration
public class Jo_HeartMapperTests {
	
	@Autowired
	private Jo_HeartMapper heartMapper;
	
	@Test
	public void testInsertHeart() {
		Jo_HeartDTO heartDTO = Jo_HeartDTO.builder()
				.mid("admin").mov_code("20212866")
				.build();
		heartMapper.insertHeart(heartDTO);
	}
	
	@Test
	public void testDeleteHeart() {
		Jo_HeartDTO heartDTO = Jo_HeartDTO.builder()
				.mid("admin").mov_code("20235253")
				.build();
		heartMapper.deleteHeart(heartDTO);
	}
	
	@Test
	public void testCheckHeart() {
		String mid = "admin";
		String[] heartList = heartMapper.checkHeart(mid);
		log.info("heartList : " + heartList);
	}
}
