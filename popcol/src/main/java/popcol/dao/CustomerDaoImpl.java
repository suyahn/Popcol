package popcol.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import popcol.model.Customer;
import popcol.model.Point;

@Repository
public class CustomerDaoImpl implements CustomerDao {
	@Autowired
	private SqlSessionTemplate sst;

	/* 도은 */
	/* 메인 */
	public void updateForbityhday() {

		sst.update("customerns.updateForbityhday");
	}

	public int loginCheck(Customer customer) {
		int result = 0;

		String insertPassword = customer.getCpassword();
		String dbPassword = sst.selectOne("customerns.loginCheck", customer);

		if (dbPassword == null) {
			// 입력한 id가 존재하지 않음
			result = -1;

		} else if (insertPassword.equals(dbPassword)) {
			// 비밀번호가 일치
			result = 1;

		} else {
			// 비밀번호 일치하지 않음
			result = 0;
		}

		return result;
	}

	public Customer getSessionCustomerInfo(String cid) {

		return sst.selectOne("customerns.getSessionCustomerInfo", cid);
	}

	public String getCustomerName(String cid) {

		return sst.selectOne("customerns.getCustomerName", cid);
	}

	public String getCustomerBirthday(String cid) {

		return sst.selectOne("customerns.getCustomerBirthday", cid);
	}

	public Customer joinCheck(Customer customer) {

		return sst.selectOne("customerns.joinCheck", customer);
	}

	public Customer idDupCheck(String cid) {

		return sst.selectOne("customerns.idDupCheck", cid);
	}

	public int insertCustomer(Customer customer) {

		return sst.insert("customerns.insertCustomer", customer);
	}

	public String findCustomerId(Customer customer) {

		return sst.selectOne("customerns.findCustomerId", customer);
	}

	public Customer findCustomerPassword(Customer customer) {

		return sst.selectOne("customerns.findCustomerPassword", customer);
	}

	public int updateFindPassword(Customer customer) {

		return sst.update("customerns.updateFindPassword", customer);
	}

	/* 마이페이지 */
	public int updateForBirthdayPoint(String cid) {

		return sst.update("customerns.updateForBirthdayPoint", cid);
	}

	public int updateCustomerInfo(Customer customer) {

		return sst.update("customerns.updateCustomerInfo", customer);
	}

	public int deleteCustomerInfo(String cid) {

		return sst.update("customerns.deleteCustomerInfo", cid);
	}
	
	/* 예매관련 포인트 */
	public int updateMoviePoint(Customer customer) {
		
		return sst.update("customerns.updateMoviePoint", customer);
	}

	public int updateUsePoint(Customer customer) {
		
		return sst.update("customerns.updateUsePoint", customer);
	}	

	/* 예매 취소할 때 사용한 포인트 돌려주기 */
	public void returnPointForCancel(Customer customer) {
		
		sst.update("customerns.returnPointForCancel", customer);	
	}
	
	/* 예매 취소할 때 받은 포인트 돌려주기 */

	/* 규랑 */

	@Override
	public int getTotal() {

		return sst.selectOne("customerns.getTotal");
	}

	@Override
	public List<Customer> adminCustomerList(int startRow, int endRow) {
		HashMap<String, Integer> hm = new HashMap<String, Integer>();
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);

		return sst.selectList("customerns.adminCustomerList", hm);
	}

	@Override
	public Customer adminCustomerSelect(String cid) {

		return sst.selectOne("customerns.adminCustomerSelect", cid);
	}

	@Override
	public int adminCustomerUpdate(Customer customer) {

		return sst.update("customerns.adminCustomerUpdate", customer);
	}
}
