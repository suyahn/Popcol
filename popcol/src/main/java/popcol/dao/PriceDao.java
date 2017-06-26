package popcol.dao;

import java.util.List;

import popcol.model.Price;

public interface PriceDao {
	List<Price> select(String timezone);

}
