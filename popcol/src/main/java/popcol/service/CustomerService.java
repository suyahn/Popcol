package popcol.service;

import java.util.List;

import popcol.model.Customer;
import popcol.model.Point;

public interface CustomerService {

	/* 도은 */
	/* 메인 */
	void updateForbirthday();

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

	int deleteCutomerInfo(String cid);

	/* 예매관련 포인트 */
	int updateMoviePoint(Customer customer);

	int updateUsePoint(Customer customer);

	/* 예매 취소할 때 사용한 포인트 돌려주기 */
	void returnPointForCancel(Customer customer);
	
	/* 예매 취소할 때 받은 포인트 돌려주기 */

	/*규랑*/
	int getTotal();

	List<Customer> adminCustomerList(int startRow, int endRow);

	Customer adminCustomerSelect(String cid);

	int adminCustomerUpdate(Customer customer);

	int adminCustomerdelete(String cid);
}