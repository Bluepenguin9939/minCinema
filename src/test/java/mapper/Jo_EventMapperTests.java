package mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.minCinema.domain.Jo_EventDTO;
import com.kh.minCinema.mapper.Jo_EventMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
@WebAppConfiguration
public class Jo_EventMapperTests {
	
	@Autowired
	private Jo_EventMapper eventMapper;
	@Test
	public void testSelectByMid() {
		
		Jo_EventDTO eventDTO = Jo_EventDTO.builder()
				.mid("test").curDate("2024/01/25")
				.build();
		log.info("eventDTO : " + eventDTO);
		String result = eventMapper.selectByMid(eventDTO);
		log.info("result : " + result);
	}
}
