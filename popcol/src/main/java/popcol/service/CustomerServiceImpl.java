package popcol.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import popcol.dao.CustomerDao;
import popcol.model.Customer;

@Service
public class CustomerServiceImpl implements CustomerService {
	@Autowired
	private CustomerDao cd;

	/* 도은 */
	/* 메인 */
	public void updateForbirthday() {

		cd.updateForbityhday();
	}

	public int loginCheck(Customer customer) {

		return cd.loginCheck(customer);
	}

	public Customer getSessionCustomerInfo(String cid) {

		return cd.getSessionCustomerInfo(cid);
	}

	public String getCustomerName(String cid) {

		return cd.getCustomerName(cid);
	}

	public String getCustomerBirthday(String cid) {

		return cd.getCustomerBirthday(cid);
	}

	public Customer joinCheck(Customer customer) {

		return cd.joinCheck(customer);
	}

	public Customer idDupCheck(String cid) {

		return cd.idDupCheck(cid);
	}

	public int insertCustomer(Customer customer) {

		return cd.insertCustomer(customer);
	}

	public String findCustomerId(Customer customer) {

		return cd.findCustomerId(customer);
	}

	public Customer findCustomerPassword(Customer customer) {

		return cd.findCustomerPassword(customer);
	}

	public int updateFindPassword(Customer customer) {

		return cd.updateFindPassword(customer);
	}
	
	/* 마이페이지 */
	public int updateForBirthdayPoint(String cid) {
		
		return cd.updateForBirthdayPoint(cid);
	}

	public int updateCustomerInfo(Customer customer) {
		
		return cd.updateCustomerInfo(customer);
	}

	public int deleteCutomerInfo(String cid) {
		
		return cd.deleteCustomerInfo(cid);
	}
	
	/* 예매관련 포인트 */
	public int updateMoviePoint(Customer customer) {
		
		return cd.updateMoviePoint(customer);
	}

	public int updateUsePoint(Customer customer) {
		
		return cd.updateUsePoint(customer);
	}

	/* 예매 취소할 때 사용한 포인트 돌려주기 */
	public void returnPointForCancel(Customer customer) {
		
		cd.returnPointForCancel(customer);
	}
	
	/* 예매 취소할 때 받은 포인트 돌려주기 */

	/* 규랑 */
	@Override
	public int getTotal() {

		return cd.getTotal();
	}

	@Override
	public List<Customer> adminCustomerList(int startRow, int endRow) {

		return cd.adminCustomerList(startRow, endRow);
	}

	@Override
	public Customer adminCustomerSelect(String cid) {

		return cd.adminCustomerSelect(cid);
	}

	@Override
	public int adminCustomerUpdate(Customer customer) {

		return cd.adminCustomerUpdate(customer);
	}

	@Override
	public int adminCustomerdelete(String cid) {
		
		return cd.adminCustomerDelete(cid);
	}

	@Override
	public List<Customer> selectCustomerList() {
		return cd.selectCustomerList();
	}
}