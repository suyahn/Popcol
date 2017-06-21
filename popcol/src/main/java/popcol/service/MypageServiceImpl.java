package popcol.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import popcol.dao.customer.MypageDao;
import popcol.model.Customer;
import popcol.model.Movie;
import popcol.model.MypageBooking;
import popcol.model.Review;

@Service
public class MypageServiceImpl implements MypageService {
	@Autowired
	private MypageDao md;

	public Customer getSessionCustomerInfo(String cid) {

		return md.getSessionCustomerInfo(cid);
	}

	public int updateForBirthdayPoint(String cid) {

		return md.updateForBirthdayPoint(cid);
	}

	public List<MypageBooking> selectMyBookingListMain(String cid, String oneMonthAgo) {

		return md.selectMyBookingListMain(cid, oneMonthAgo);
	}

	public int updateCustomerInfo(Customer customer) {

		return md.updateCustomerInfo(customer);
	}

	public int deleteCutomerInfo(String cid) {

		return md.deleteCustomerInfo(cid);
	}

	public List<MypageBooking> selectMyBookingList(String cid, String oneMonthAgo) {

		return md.selectMyBookingList(cid, oneMonthAgo);
	}

	public List<MypageBooking> selectMyPriceSeatList(String cid, String oneMonthAgo) {

		return md.selectMyPriceSeatList(cid, oneMonthAgo);
	}

	public int deleteBooking(String ticketnumber, String cid) {

		return md.deleteBooking(ticketnumber, cid);
	}

	public List<MypageBooking> selectMySeeMovieList(String cid) {

		return md.selectMySeeMovieList(cid);
	}

	public List<Review> selectMyReviewList(String cid) {

		return md.selectMyReviewList(cid);
	}

	public Review selectReview(Review review) {

		return md.selectReview(review);
	}

	public int deleteReview(Review review) {

		return md.deleteReview(review);
	}

	public int insertReview(Review review) {

		return md.insertReview(review);
	}

	public Review selectReviewForUpdate(Review review) {

		return md.selectReviewForUpdate(review);
	}

	public int updateReview(Review review) {

		return md.updateReview(review);
	}

	public Movie selectMovieForReview(int mid) {
		
		return md.selectMovieForReview(mid);
	}
}
