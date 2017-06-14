package popcol.service.customer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import popcol.dao.customer.MypageDao;

@Service
public class MypageServiceImpl implements MypageService{
	@Autowired
	private MypageDao md;
}
