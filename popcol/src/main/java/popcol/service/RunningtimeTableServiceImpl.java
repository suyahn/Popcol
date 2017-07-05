package popcol.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import popcol.dao.RunningtimeTableDao;
import popcol.model.Movie;
import popcol.model.RunningtimeTable;

@Service
public class RunningtimeTableServiceImpl implements RunningtimeTableService {
	@Autowired
	private RunningtimeTableDao rtd;

	@Override
	public List<RunningtimeTable> runningtimeTableList() {
		return rtd.runningtimeTableList();
	}
	/*규랑*/
	@Override
	public List<RunningtimeTable> adminTTList(int startRow, int endRow) {

		return rtd.adminTTList(startRow, endRow);
	}

	@Override
	public int getTotal1() {

		return rtd.getTotal1();
	}

	@Override
	public int getTotal2(RunningtimeTable runningtimeTable) {

		return rtd.getTotal2(runningtimeTable);
	}
	@Override
	public int adminTTInsert(RunningtimeTable runningtimeTable) {
		
		return rtd.adminTTInsert(runningtimeTable);
	}

	/*@Override
	public int adminTTInsert(RunningtimeTable runningtimeTable) {
		
		return rtd.adminTTInsert(runningtimeTable);*/

	/*혜진*/
	@Override
	public List<RunningtimeTable> showtimesList(int lid, Date date) {
		return rtd.showtimesList(lid, date);
	}
	@Override
	public List<Movie> movieList(int lid, Date date) {
		return rtd.movieList(lid, date);
	}
	@Override
	public List<RunningtimeTable> bookedSeatCountList(int lid, Date date) {
		return rtd.bookedSeatCountList(lid, date);

	}
	
}
