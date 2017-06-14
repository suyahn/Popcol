package popcol.service.booking;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import popcol.dao.booking.BookingDao;
import popcol.model.Location;
import popcol.model.Movie;
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

}
