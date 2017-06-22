package popcol.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import popcol.dao.MovieDao;
import popcol.model.Movie;

@Service
public class MovieServiceImpl implements MovieService {
	/*수연*/
	@Autowired
	private MovieDao md;
	
	@Override
	public List<Movie> movieChart() {
		return md.movieChart();
	}
	@Override
	public Movie movieDetail(int mid) {
		return md.movieDetail(mid);
	}
	@Override
	public List<Movie> reviewGoodBadCount() {
		return md.reviewGoodBadCount();
	}
	@Override
	public List<Movie> nowMoviesList() {
		return md.nowMoviesList();
	}

	
	
	/*규랑*/
	@Override
	public List<Movie> adminList(int startRow, int endRow) {
		return md.adminList(startRow,endRow);
	}
	
	@Override
	public int getTotal() {
		return md.getTotal();
	}
	@Override
	public int adminInsert(Movie movie) {
		
		return md.adminInsert(movie);
	}
	@Override
	public Movie adminSelect(int mid) {
		
		return md.adminSelect(mid);
	}
	@Override
	public int adminUpdate(Movie movie) {
		
		return md.adminUpdate(movie);
	}
	@Override
	public int adminDelete(int mid) {
		
		return md.adminDelete(mid);
	}
	
	/* 도은 */
	/* 마이페이지 */
	public Movie selectMovieForReview(int mid) {
		
		return md.selectMovieForReview(mid);
	}
	
}
