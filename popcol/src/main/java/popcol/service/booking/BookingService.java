package popcol.service.booking;

import java.util.List;

import popcol.model.Location;
import popcol.model.Movie;
import popcol.model.RunningtimeTable;

public interface BookingService {

	List<Movie> movieList();
	List<Location> locationList(int mid);
	List<RunningtimeTable> dateList(int mid, int lid);

}
