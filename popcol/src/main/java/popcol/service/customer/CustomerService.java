package popcol.service.customer;

import java.sql.Date;

import popcol.model.Customer;

public interface CustomerService {

	int loginCheck(Customer customer);

	String getCustomerName(String cid);

	String getCustomerBirthday(String cid);

	Customer joinCheck(Customer customer);

	Customer idDupCheck(String cid);

	int insertCustomer(Customer customer);

	String findCustomerId(Customer customer);

	Customer findCustomerPassword(Customer customer);

	int updateFindPassword(Customer customer);

}