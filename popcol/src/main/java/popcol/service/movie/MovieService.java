package popcol.service.movie;

import java.util.List;

import popcol.model.Movie;

public interface MovieService {
	List<Movie> movieChart();
	/*규랑*/
	List<Movie> adminList(int startRow, int endRow);
	int getTotal();
	int adminInsert(Movie movie);
	Movie adminSelect(int mid);
	
}
