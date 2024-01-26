package mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.TypeMismatchDataAccessException;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.minCinema.domain.Ham_TestVO;
import com.kh.minCinema.domain.Jo_EventDTO;
import com.kh.minCinema.mapper.Ham_TestMapper;
import com.kh.minCinema.mapper.Jo_EventMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
@WebAppConfiguration
public class Ham_adminTest {
	
	@Autowired
	private Ham_TestMapper ham_TestMapper;
	
	@Test
	public void testMember() {
		Ham_TestVO testVO = Ham_TestVO.builder()
				.tmid("ss")
				.tmnick("sss")
				.tmname("ssss")
				.tmemail("sss@na.com")
				.tmtel("010-2222-2222")
				.build();
		ham_TestMapper.insertTest(testVO);
	}
	
}
