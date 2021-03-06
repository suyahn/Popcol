package popcol.dao;

import java.util.Date;
import java.util.List;

import popcol.model.Movie;
import popcol.model.RunningtimeTable;

public interface RunningtimeTableDao {
	List<RunningtimeTable> runningtimeTableList();

	/*규랑*/
	List<RunningtimeTable> adminTTList(int startRow, int endRow);
	/*상영시간표 상세보기*/
	RunningtimeTable adminTTSelect(int rtid);
	List<Movie> adminSelectedDateMovieList(int lid, Date date);
	List<RunningtimeTable> adminTTList(int lid, Date date);

	
	/*상영시간표 업데이트*/
	int adminTTUpdate(RunningtimeTable runningtimeTable);
	
	int getTotal1();
	int getTotal2(RunningtimeTable runningtimeTable);

	int adminTTInsert(RunningtimeTable runningtimeTable);
	int adminTTDelete(int rtid);
	
	int getMaxRtid();


	/*혜진*/
	List<RunningtimeTable> showtimesList(int lid, Date date);
	List<Movie> movieList(int lid, Date date);
	List<RunningtimeTable> bookedSeatCountList(int lid, Date date);

	
	
	

	

	

	

	

}
