package popcol.dao;

import java.util.Date;
import java.util.List;

import popcol.model.Movie;
import popcol.model.RunningtimeTable;

public interface RunningtimeTableDao {
	List<RunningtimeTable> runningtimeTableList();

	/*규랑*/
	List<RunningtimeTable> adminTTList(int startRow, int endRow);

	int getTotal1();

	int getTotal2(RunningtimeTable runningtimeTable);
	/*혜진*/
	List<RunningtimeTable> showtimesList(int lid, Date date);
	List<Movie> movieList(int lid, Date date);
}
