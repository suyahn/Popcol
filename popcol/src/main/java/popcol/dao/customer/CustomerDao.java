package popcol.dao.customer;

import java.util.List;

import popcol.model.Customer;

public interface CustomerDao {

	void updateForbityhday();

	int loginCheck(Customer customer);

	Customer getSessionCustomerInfo(String cid);

	String getCustomerName(String cid);

	String getCustomerBirthday(String cid);

	Customer joinCheck(Customer customer);

	Customer idDupCheck(String cid);

	int insertCustomer(Customer customer);

	String findCustomerId(Customer customer);

	Customer findCustomerPassword(Customer customer);

	int updateFindPassword(Customer customer);
	
	/*규랑*/
	
	int getTotal();

	List<Customer> adminCustomerList(int startRow, int endRow);

	Customer adminCustomerSelect(String cid);

}