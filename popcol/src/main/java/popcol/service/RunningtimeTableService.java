package popcol.service;

import java.util.Date;
import java.util.List;

import popcol.model.Movie;
import popcol.model.RunningtimeTable;

public interface RunningtimeTableService {
	List<RunningtimeTable> runningtimeTableList();
	/*규랑*/
	List<RunningtimeTable> adminTTList(int startRow, int endRow);

	int getTotal1();

	int getTotal2(RunningtimeTable runningtimeTable);

	
	int adminTTInsert(RunningtimeTable runningtimeTable);

	/*혜진*/
	List<RunningtimeTable> showtimesList(int lid, Date date);
	List<Movie> movieList(int lid, Date date);
	List<RunningtimeTable> bookedSeatCountList(int lid, Date date);

}
