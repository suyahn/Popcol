package popcol.service.movie;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import popcol.dao.movie.MovieDao;
import popcol.model.Movie;

@Service
public class MovieServiceImpl implements MovieService {
	@Autowired
	private MovieDao md;
	
	@Override
	public List<Movie> movieChart() {
		return md.movieChart();
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
	

}
