package popcol.service;

import java.util.List;

import popcol.model.Price;

public interface PriceService {
	List<Price> select(String timezone);
}
