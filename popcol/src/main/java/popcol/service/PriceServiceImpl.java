package popcol.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import popcol.dao.PriceDaoImpl;

@Service
public class PriceServiceImpl implements PriceService{
	@Autowired
	private PriceDaoImpl pd;
}
