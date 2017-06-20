package popcol.dao.booking;

import java.util.List;


import popcol.model.Location;
import popcol.model.Movie;
import popcol.model.RunningtimeTable;

public interface BookingDao {

	List<Movie> movieList();
	List<Location> locationList(int mid);
	List<RunningtimeTable> dateList(int mid, int lid);
	List<RunningtimeTable> timeList(int mid, int lid, int rtid);
	RunningtimeTable selectRt(int rtid);

}
