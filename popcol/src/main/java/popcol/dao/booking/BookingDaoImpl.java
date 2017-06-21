package popcol.dao.booking;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import popcol.model.Booking;
import popcol.model.Location;
import popcol.model.Movie;
import popcol.model.Price;
import popcol.model.RunningtimeTable;

@Repository
public class BookingDaoImpl implements BookingDao{
	@Autowired
	private SqlSessionTemplate sst;

	public List<Movie> movieList() {
		return sst.selectList("moviens.bookingMovieList");
	}

	public List<Location> locationList(int mid) {
		return sst.selectList("locationns.bookingLocationList",mid);
	}
	public List<RunningtimeTable> dateList(int mid, int lid) {
		HashMap<String , Integer> date=new HashMap<String, Integer>();
		date.put("mid", mid);
		date.put("lid", lid);
		return sst.selectList("runningtimetablens.bookingRTList", date);
	}
	public List<RunningtimeTable> timeList(int mid, int lid, int rtid) {
		HashMap<String,Integer> time=new HashMap<String,Integer>();
		time.put("mid",mid); time.put("lid", lid); time.put("rtid", rtid);
		return sst.selectList("runningtimetablens.bookingRttList",time);
	}
	public RunningtimeTable selectRt(int rtid) {
		return sst.selectOne("runningtimetablens.bookingrtList",rtid);
	}
	public List<Booking> seatrtList(int rtid) {
		return sst.selectList("bookingns.bookingRtSList",rtid);
	}
	public List<Price> timezonePricestList(String timezone) {
		return sst.selectList("pricens.timezonePriceList", timezone);
	}
}
