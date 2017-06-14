package popcol.dao.customer;

import popcol.model.Customer;

public interface CustomerDao {

	int loginCheck(Customer customer);

	String getCustomerName(String id);

	Customer joinCheck(Customer customer);

	Customer idDupCheck(String cid);

	int insertCustomer(Customer customer);

	String findCustomerId(Customer customer);

	Customer findCustomerPassword(Customer customer);

	int updateFindPassword(Customer customer);

}