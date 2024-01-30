package mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.minCinema.domain.Heo_PointVO;
import com.kh.minCinema.domain.Jo_EventDTO;
import com.kh.minCinema.mapper.Heo_PointMapper;
import com.kh.minCinema.mapper.Jo_EventMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
@WebAppConfiguration
public class Heo_PointMapperTests {
	
	@Autowired
	private Heo_PointMapper heo_PointMapper;
	@Test
	public void insertTest() {
		
		for (int i = 10000; i < 10099; i++) {
			Heo_PointVO heo_PointVO = Heo_PointVO.builder()
					.mid("test")
					.ppoint(i)
					.pcode("PC")
					.build();
			log.info(heo_PointMapper.insertPoint(heo_PointVO));
		}
		
	}
}
