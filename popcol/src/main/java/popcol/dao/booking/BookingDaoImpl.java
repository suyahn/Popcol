package popcol.dao.booking;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BookingDaoImpl implements BookingDao{
	@Autowired
	private SqlSessionTemplate sst;
	

}
