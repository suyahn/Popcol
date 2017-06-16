package popcol.service.customer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import popcol.dao.customer.MypageDao;
import popcol.model.Customer;

@Service
public class MypageServiceImpl implements MypageService{
	@Autowired
	private MypageDao md;

	public Customer getSessionCustomerInfo(String cid) {
		
		return md.getSessionCustomerInfo(cid);
	}

	public int updateForBirthdayPoint(String cid) {
		
		return md.updateForBirthdayPoint(cid);
	}

	public int updateCustomerInfo(Customer customer) {
		
		return md.updateCustomerInfo(customer);
	}
}
