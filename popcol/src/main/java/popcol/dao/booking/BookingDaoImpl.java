package popcol.dao.booking;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import popcol.model.Location;
import popcol.model.Movie;
import popcol.model.RunningtimeTable;

@Repository
public class BookingDaoImpl implements BookingDao{
	@Autowired
	private SqlSessionTemplate sst;

	@Override
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
}
