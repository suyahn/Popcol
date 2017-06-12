package popcol.service.price;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import popcol.dao.price.PriceDaoImpl;

@Service
public class PriceServiceImpl implements PriceService{
	@Autowired
	private PriceDaoImpl pd;
}
