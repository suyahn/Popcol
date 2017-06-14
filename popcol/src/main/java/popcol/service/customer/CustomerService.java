package popcol.service.customer;

import popcol.model.Customer;

public interface CustomerService {

	int loginCheck(Customer customer);

	Customer getSessionInfo(String id);

	Customer joinCheck(Customer customer);

	Customer idDupCheck(String cid);

	int insertCustomer(Customer customer);

	String findCustomerId(Customer customer);

}