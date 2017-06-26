package popcol.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TheaterDaoImpl implements TheaterDao {
	@Autowired
	private SqlSessionTemplate sst;
}
