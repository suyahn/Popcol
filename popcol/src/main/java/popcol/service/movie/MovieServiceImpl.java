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
		// TODO Auto-generated method stub
		return md.movieChart();
	}

}
