package mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.minCinema.domain.Jo_EventDTO;
import com.kh.minCinema.domain.Jo_EventRewardVO;
import com.kh.minCinema.mapper.Jo_EventMapper;
import com.kh.minCinema.mapper.Jo_EventRewardMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
@WebAppConfiguration
public class Jo_EventMapperTests {
	
	@Autowired
	private Jo_EventMapper eventMapper;
	
	@Autowired
	private Jo_EventRewardMapper eventRewardMapper;
	
	@Test
	public void testSelectByMid() {
		Jo_EventDTO eventDTO = Jo_EventDTO.builder()
				.mid("test").curDate("2024/01/25")
				.build();
		log.info("eventDTO : " + eventDTO);
		String result = eventMapper.selectByMid(eventDTO);
		log.info("result : " + result);
	}
	
	@Test
	public void testChange() {
		List<String> result = eventMapper.changeImg("test");
		log.info("result : " + result);
	}
	
	@Test
	public void testcheckReceive() {
		Jo_EventRewardVO eventRewardVO = Jo_EventRewardVO.builder()
				.mid("test").r_month("02").r_history("1")
				.build();
		int count = eventRewardMapper.checkReceive(eventRewardVO);
		log.info(count);
	}
}
