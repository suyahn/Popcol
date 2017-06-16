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

	public List<Booking> selectMyBookingList(String cid, String oneMonthAgo) {
		HashMap<String, String> hs = new HashMap<String, String>();
		hs.put("cid", cid);
		hs.put("oneMonthAgo", oneMonthAgo);
		
		return sst.selectList("bookingns.selectMyBookingList", hs);
	}

	public Movie selectBookingMovie(int mid) {
		
		return sst.selectOne("moviens.selectBookingMovie", mid);
	}

	public Location selectBookingLocation(int lid) {
		
		return sst.selectOne("locationns.selectBookingLocation", lid);
	}

	public Theater selectBookingTheater(int tid) {
		
		return sst.selectOne("theaterns.selectBookingTheater", tid);
	}

	public RunningtimeTable selectBookingRunningtimeTable(int rtid) {
		
		return sst.selectOne("runningtimetablens.selectBookingRunningtimeTable", rtid);
	}
	
	public Price selectBookingPrice(int pid) {
	
		return sst.selectOne("pricens.selectBookingPrice", pid);
	}
}
