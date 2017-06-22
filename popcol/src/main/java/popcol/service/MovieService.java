package popcol.service;

import java.util.List;

import popcol.model.Movie;

public interface MovieService {
	List<Movie> movieChart();
	Movie movieDetail(int mid);
	/*규랑*/
	List<Movie> adminList(int startRow, int endRow);
	int getTotal();
	int adminInsert(Movie movie);
	Movie adminSelect(int mid);
	int adminUpdate(Movie movie);
	int adminDelete(int mid);
	
	/* 도은 */
	/* 마이페이지 */
	Movie selectMovieForReview(int mid);
	
}
