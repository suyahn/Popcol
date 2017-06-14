package popcol.dao.customer;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import popcol.model.Customer;

@Repository
public class CustomerDaoImpl implements CustomerDao {
	@Autowired
	private SqlSessionTemplate sst;

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

	public Customer getSessionInfo(String id) {
		
		return sst.selectOne("customerns.getSessionInfo", id);
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
}
