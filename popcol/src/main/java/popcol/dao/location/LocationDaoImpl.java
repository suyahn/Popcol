package popcol.dao.location;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LocationDaoImpl implements LocationDao {
	@Autowired
	private SqlSessionTemplate sst;
}
