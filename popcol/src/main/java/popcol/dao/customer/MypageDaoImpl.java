package popcol.dao.customer;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import popcol.model.Customer;
import popcol.model.Movie;
import popcol.model.MypageBooking;
import popcol.model.Review;

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

	public List<MypageBooking> selectMyBookingListMain(String cid, String oneMonthAgo) {
		HashMap<String, String> hs = new HashMap<String, String>();
		hs.put("cid", cid);
		hs.put("oneMonthAgo", oneMonthAgo);
		
		return sst.selectList("mypagebookingns.selectMyBookingListMain", hs);
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

	public List<MypageBooking> selectMySeeMovieList(String cid) {
		
		return sst.selectList("mypagebookingns.selectMySeeMovieList", cid);
	}
	
	public List<Review> selectMyReviewList(String cid) {
		
		return sst.selectList("reviewns.selectMyReviewList", cid);
	}

	public Review selectReview(Review review) {
		
		return sst.selectOne("reviewns.selectReview", review);
	}

	public int deleteReview(Review review) {
		
		return sst.update("reviewns.deleteReview", review);
	}

	public int insertReview(Review review) {
		
		return sst.insert("reviewns.insertReview", review);
	}

	public Review selectReviewForUpdate(Review review) {
		
		return sst.selectOne("reviewns.selectReviewForUpdate", review);
	}

	public int updateReview(Review review) {
		
		return sst.update("reviewns.updateReview", review);
	}

	public Movie selectMovieForReview(int mid) {
		
		return sst.selectOne("moviens.selectMovieForReview", mid);
	}
}
