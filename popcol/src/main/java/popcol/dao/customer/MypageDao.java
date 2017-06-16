package popcol.dao.customer;

import popcol.model.Customer;

public interface MypageDao {

	Customer getSessionCustomerInfo(String cid);

	int updateForBirthdayPoint(String cid);

	int updateCustomerInfo(Customer customer);

}
