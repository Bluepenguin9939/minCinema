package mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.minCinema.domain.Ham_OneononeVO;
import com.kh.minCinema.mapper.Ham_OneononeMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
@WebAppConfiguration
public class Ham_OneononeTest {
	
	@Autowired
	private Ham_OneononeMapper ham_OneononeMapper;
	
	@Test
	public void insertTest() {
		for(int i =1; i <= 10; i++) {			
		Ham_OneononeVO ham_OneononeVO = Ham_OneononeVO.builder()
				.rn(i)
				.sender(String.valueOf(i))
				.msg_id(String.valueOf(i))
				.mtitle("1")
				.message("1")
				.build();
		ham_OneononeMapper.insertInquiry(ham_OneononeVO);
		}
	}
	@Test
	public void insertTest2() {
			
				
			Ham_OneononeVO ham_OneononeVO = Ham_OneononeVO.builder()
					.rn(12)
					.sender("55")
					.msg_id("55")
					.mtitle("1")
					.message("1")
					.build();
			ham_OneononeMapper.insertInquiry(ham_OneononeVO);
			
		}
	
	
	@Test
	public void listTest(){
		ham_OneononeMapper.selectOne();
	}
	
}
