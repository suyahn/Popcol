package popcol.dao;

import java.util.List;

import popcol.model.Booking;
import popcol.model.Location;
import popcol.model.Movie;
import popcol.model.Price;
import popcol.model.RunningtimeTable;

public interface BookingDao {

	List<Movie> movieList();
	List<Location> locationList(int mid);
	/*List<RunningtimeTable> dateList(int mid, int lid);*/
	List<RunningtimeTable> dateList(int mid, int lid);
	RunningtimeTable selectRt(int rtid);
	List<Booking> seatrtList(int rtid);
	List<Price> timezonePricestList(String timezone);
	String getMaxticketnumber();
	int insert(Booking booking);
	

	
	/* 도은 */
	/* 마이페이지 */
	int deleteBooking(String ticketnumber, String cid);

}
