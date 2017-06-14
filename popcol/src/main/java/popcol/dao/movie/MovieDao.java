package popcol.dao.movie;

import java.util.List;

import popcol.model.Movie;

public interface MovieDao {
	List<Movie> movieChart();
	List<Movie> adminList(int startRow, int endRow);
	int getTotal();
	Movie select(int mid);
}
