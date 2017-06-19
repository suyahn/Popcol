package popcol.dao.customer;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import popcol.model.Booking;
import popcol.model.Customer;
import popcol.model.Location;
import popcol.model.Movie;
import popcol.model.MypageBooking;
import popcol.model.Price;
import popcol.model.RunningtimeTable;
import popcol.model.Theater;

@Repository
public class MypageDaoImpl implements MypageDao {
	@Autowired
	private SqlSessionTemplate sst;

	public Customer getSessionCustomerInfo(String cid) {
		
		return sst.selectOne("customerns.getSessionCustomerInfo", cid);
	}

	public int updateForBirthdayPoint(String cid) {
	
		return sst.update("customerns.updateForBirthdayPoint", cid);
	}

	public int updateCustomerInfo(Customer customer) {
		
		return sst.update("customerns.updateCustomerInfo", customer);
	}

	public int deleteCustomerInfo(String cid) {
		
		return sst.update("customerns.deleteCustomerInfo", cid);
	}

	public List<MypageBooking> selectMyBookingList(String cid, String oneMonthAgo) {
		HashMap<String, String> hs = new HashMap<String, String>();
		hs.put("cid", cid);
		hs.put("oneMonthAgo", oneMonthAgo);
		
		return sst.selectList("mypagebookingns.selectMyBookingList", hs);
	}

	public List<MypageBooking> selectMyPriceSeatList(String cid, String oneMonthAgo) {
		HashMap<String, String> hs = new HashMap<String, String>();
		hs.put("cid", cid);
		hs.put("oneMonthAgo", oneMonthAgo);
		
		return sst.selectList("mypagebookingns.selectMyPriceSeatList", hs);
	}

	public int deleteBooking(String ticketnumber, String cid) {
		HashMap<String, String> hs = new HashMap<String, String>();
		hs.put("cid", cid);
		hs.put("ticketnumber", ticketnumber);
		sst.update("mypagebookingns.deleteBookingPoint", hs);
		
		return sst.delete("mypagebookingns.deleteBooking", ticketnumber);
	}
}
