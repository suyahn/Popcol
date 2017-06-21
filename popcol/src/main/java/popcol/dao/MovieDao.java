package popcol.dao;

import java.util.List;

import popcol.model.Movie;

public interface MovieDao {
	List<Movie> movieChart();
	Movie movieDetail(int mid);
	/*규랑*/
	List<Movie> adminList(int startRow, int endRow);
	int getTotal();
	int adminInsert(Movie movie);
	Movie adminSelect(int mid);
	int adminUpdate(Movie movie);
	int adminDelete(int mid);
	
	
}
