package popcol.service.customer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import popcol.dao.customer.CustomerDao;
import popcol.model.Customer;

@Service
public class CustomerServiceImpl implements CustomerService{
	@Autowired
	private CustomerDao cd;
	
	public int loginCheck(Customer customer) {
		
		return cd.loginCheck(customer);
	}
	
	public Customer getSessionInfo(String id) {
		
		return cd.getSessionInfo(id);
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
}