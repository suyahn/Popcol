package popcol.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import popcol.dao.BookingDao;
import popcol.model.Booking;
import popcol.model.Location;
import popcol.model.Movie;
import popcol.model.Price;
import popcol.model.RunningtimeTable;


@Service
public class BookingServiceImpl implements BookingService {
	@Autowired
	private BookingDao bd;

	@Override
	public List<Movie> movieList() {
		return bd.movieList();
	}

	public List<Location> locationList(int mid) {
		return bd.locationList(mid);
	}
	public List<RunningtimeTable> dateList(int mid, int lid) {
		return bd.dateList(mid,lid);
	}
	public List<RunningtimeTable> timeList(int mid, int lid, int rtid) {
		return bd.timeList(mid,lid,rtid);
	}
	public RunningtimeTable selectRt(int rtid) {
		return bd.selectRt(rtid);
	}
	public List<Booking> seatrtList(int rtid) {
		return bd.seatrtList(rtid);
	}
	public List<Price> timezonePricestList(String timezone) {
		return bd.timezonePricestList(timezone);
	}
	public String getMaxticketnumber() {
		return bd.getMaxticketnumber();
	}
	public int insert(Booking booking) {
		return bd.insert(booking);
	}



	/* 도은 */
	/* 마이페이지 */
	public int deleteBooking(String ticketnumber, String cid) {
		
		return bd.deleteBooking(ticketnumber, cid);
	}

	
}
