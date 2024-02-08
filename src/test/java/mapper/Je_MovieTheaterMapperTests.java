package mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.minCinema.domain.Jo_ReservedHistoryDTO;
import com.kh.minCinema.mapper.Je_MovieTheaterMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
@WebAppConfiguration
public class Je_MovieTheaterMapperTests {
	
	@Autowired
	private Je_MovieTheaterMapper movieTheaterMapper;
	
	@Test
	public void testReservedHistory() {
		List<Jo_ReservedHistoryDTO> reservedList = movieTheaterMapper.selectReservedHistory("test");
		log.info("reservedList : " + reservedList);
	}
}
