package popcol.dao.event;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EventDaoImpl implements EventDao {
	@Autowired
	private SqlSessionTemplate sst;

}
