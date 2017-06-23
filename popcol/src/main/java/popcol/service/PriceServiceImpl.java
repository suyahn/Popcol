package popcol.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import popcol.dao.PriceDao;
import popcol.model.Price;

@Service
public class PriceServiceImpl implements PriceService{
	@Autowired
	private PriceDao pd;

	public List<Price> select(String timezone) {
		return pd.select(timezone);
	}
}
