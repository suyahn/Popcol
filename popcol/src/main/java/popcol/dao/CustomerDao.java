package popcol.dao;

import java.util.List;

import popcol.model.Customer;

public interface CustomerDao {

	/* 도은 */
	/* 메인 */
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

	/* 마이페이지 */
	int updateForBirthdayPoint(String cid);

	int updateCustomerInfo(Customer customer);

	int deleteCustomerInfo(String cid);
	
	/*규랑*/
	
	int getTotal();

	List<Customer> adminCustomerList(int startRow, int endRow);

	Customer adminCustomerSelect(String cid);

	int adminCustomerUpdate(Customer customer);

}