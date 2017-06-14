package popcol.service.movie;

import java.util.List;

import popcol.model.Movie;

public interface MovieService {
	List<Movie> movieChart();
	List<Movie> adminList(int startRow, int endRow);
	int getTotal();
	Movie select(int mid);
}
