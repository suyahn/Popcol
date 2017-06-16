package popcol.service.customer;

import popcol.model.Customer;

public interface MypageService {

	Customer getSessionCustomerInfo(String cid);

	int updateForBirthdayPoint(String cid);

	int updateCustomerInfo(Customer customer);

	int deleteCutomerInfo(String cid);

}
