package mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.minCinema.domain.Jo_CouponVO;
import com.kh.minCinema.domain.Jo_HeartDTO;
import com.kh.minCinema.mapper.Jo_CouponMapper;
import com.kh.minCinema.mapper.Jo_HeartMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
@WebAppConfiguration
public class Jo_CouponMapperTests {
	
	@Autowired
	private Jo_CouponMapper couponMapper;
	
	@Test
	public void testSelectAllCoupon() {
		int count = couponMapper.selectAllCoupon("test");
		log.info(count);
	}
	
	@Test
	public void testDeleteCoupon() {
		Jo_CouponVO couponVO = Jo_CouponVO.builder()
				.mid("admin").discount(5)
				.build();
		couponMapper.deleteCoupon(couponVO);
	}
}
