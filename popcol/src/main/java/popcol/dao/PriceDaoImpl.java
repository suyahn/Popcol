package popcol.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import popcol.model.Price;

@Repository
public class PriceDaoImpl implements PriceDao {
	@Autowired
	private SqlSessionTemplate sst;

	public List<Price> select(String timezone) {
		return sst.selectList("pricens.timezonePriceList", timezone);
	}

}
