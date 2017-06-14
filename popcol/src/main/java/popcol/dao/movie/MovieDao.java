package popcol.dao.movie;

import java.util.List;

import popcol.model.Movie;

public interface MovieDao {
	List<Movie> movieChart();
	/*규랑*/
	List<Movie> adminList(int startRow, int endRow);
	int getTotal();
	int adminInsert(Movie movie);
	Movie adminSelect(int mid);
	int adminUpdate(Movie movie);
	
	
}
