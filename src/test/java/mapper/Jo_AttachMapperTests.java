package mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.minCinema.domain.Heo_MemberVO;
import com.kh.minCinema.mapper.Jo_AttachMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
@WebAppConfiguration
public class Jo_AttachMapperTests {
	
	@Autowired
	private Jo_AttachMapper jo_AttachMapper;
	
	@Test
	public void testSelectFile() {
		Heo_MemberVO memberVO = jo_AttachMapper.selectFile("test");
		log.info("memberVO : " + memberVO);
	}
	
	@Test
	public void testCheckProfileImage() {
		int count = jo_AttachMapper.checkProfileImage("test");
	}
	
	@Test
	public void testSelectMovieImageToCode() {
		List<Jo_AttachVO> attachList = jo_AttachMapper.selectMovieImageToCode("20124062");
		log.info(attachList);
	}
	
}
