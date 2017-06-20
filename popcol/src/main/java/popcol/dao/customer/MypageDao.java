package popcol.dao.customer;

import java.util.List;

import popcol.model.Customer;
import popcol.model.Movie;
import popcol.model.MypageBooking;
import popcol.model.Review;

public interface MypageDao {

	Customer getSessionCustomerInfo(String cid);

	int updateForBirthdayPoint(String cid);

	List<MypageBooking> selectMyBookingListMain(String cid, String oneMonthAgo);

	int updateCustomerInfo(Customer customer);

	int deleteCustomerInfo(String cid);

	List<MypageBooking> selectMyBookingList(String cid, String oneMonthAgo);

	List<MypageBooking> selectMyPriceSeatList(String cid, String oneMonthAgo);

	int deleteBooking(String ticketnumber, String cid);

	List<MypageBooking> selectMySeeMovieList(String cid);

	List<Review> selectMyReviewList(String cid);
	
	Review selectReview(Review review);

	int deleteReview(Review review);

	int insertReview(Review review);

	Review selectReviewForUpdate(Review review);

	int updateReview(Review review);

	Movie selectMovieForReview(int mid);

}
