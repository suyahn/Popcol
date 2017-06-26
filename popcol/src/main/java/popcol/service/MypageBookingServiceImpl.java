package popcol.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import popcol.dao.MypageBookingDao;
import popcol.model.MypageBooking;

@Service
public class MypageBookingServiceImpl implements MypageBookingService {
	@Autowired
	private MypageBookingDao mbd;

	/* 도은 */
	/* 마이페이지 */
	public List<MypageBooking> selectMyBookingListMain(String cid, String oneMonthAgo) {

		return mbd.selectMyBookingListMain(cid, oneMonthAgo);
	}

	public List<MypageBooking> selectMyPriceSeatList(String cid, String oneMonthAgo) {
		
		return mbd.selectMyPriceSeatList(cid, oneMonthAgo);
	}

	public List<MypageBooking> selectMyBookingList(String cid, String oneMonthAgo) {
		
		return mbd.selectMyBookingList(cid, oneMonthAgo);
	}

	public List<MypageBooking> selectMySeeMovieList(String cid) {
		
		return mbd.selectMySeeMovieList(cid);
	}
}
