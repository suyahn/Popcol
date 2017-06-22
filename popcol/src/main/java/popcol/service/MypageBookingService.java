package popcol.service;

import java.util.List;

import popcol.model.MypageBooking;

public interface MypageBookingService {

	/* 도은 */
	/* 마이페이지 */
	List<MypageBooking> selectMyBookingListMain(String cid, String oneMonthAgo);

	List<MypageBooking> selectMyPriceSeatList(String cid, String oneMonthAgo);

	List<MypageBooking> selectMyBookingList(String cid, String oneMonthAgo);

	List<MypageBooking> selectMySeeMovieList(String cid);

}
