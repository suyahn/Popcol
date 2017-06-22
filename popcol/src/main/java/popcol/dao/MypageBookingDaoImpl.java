package popcol.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import popcol.model.MypageBooking;

@Repository
public class MypageBookingDaoImpl implements MypageBookingDao {
	@Autowired
	private SqlSessionTemplate sst;
	
	/* 도은 */
	/* 마이페이지 */
	public List<MypageBooking> selectMyBookingListMain(String cid, String oneMonthAgo) {
		HashMap<String, String> hs = new HashMap<String, String>();
		hs.put("cid", cid);
		hs.put("oneMonthAgo", oneMonthAgo);
		
		return sst.selectList("mypagebookingns.selectMyBookingListMain", hs);
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

	public List<MypageBooking> selectMySeeMovieList(String cid) {
		
		return sst.selectList("mypagebookingns.selectMySeeMovieList", cid);
	}
}
