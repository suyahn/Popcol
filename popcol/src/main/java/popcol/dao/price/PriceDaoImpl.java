package popcol.dao.price;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PriceDaoImpl implements PriceDao {
	@Autowired
	private SqlSessionTemplate sst;

}
