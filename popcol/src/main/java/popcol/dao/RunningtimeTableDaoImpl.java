package popcol.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import popcol.model.Movie;
import popcol.model.RunningtimeTable;

@Repository
public class RunningtimeTableDaoImpl implements RunningtimeTableDao {
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public List<RunningtimeTable> runningtimeTableList() {
		return sst.selectList("runningtimetablens.runningtimeTableList");
	}

	/* 규랑 */
	@Override
	public List<RunningtimeTable> adminTTList(int startRow, int endRow) {
		HashMap<String, Integer> hm = new HashMap<String, Integer>();
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		return sst.selectList("runningtimetablens.adminTTList", hm);
	}

	@Override
	public RunningtimeTable adminTTSelect(int rtid) {

		return sst.selectOne("runningtimetablens.adminTTSelect", rtid);
	}
	@Override
	public List<Movie> adminSelectedDateMovieList(int lid, Date date) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("lid", lid);
		hm.put("date", date);
		return sst.selectList("moviens.adminSelectedDateMovieList", hm);
	}

	@Override
	public List<RunningtimeTable> adminTTList(int lid, Date date) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("lid", lid);
		hm.put("date", date);
		return sst.selectList("runningtimetablens.adminTTList", hm);
	}

	/* 상영시간표 업데이트 */
	@Override
	public int adminTTUpdate(RunningtimeTable runningtimeTable) {

		return sst.update("runningtimetablens.adminTTUpdate", runningtimeTable);
	}

	@Override
	public int getTotal1() {

		return sst.selectOne("runningtimetablens.getTotal1");
	}

	@Override
	public int getTotal2(RunningtimeTable runningtimeTable) {

		return sst.selectOne("runningtimetablens.getTotal2", runningtimeTable);
	}

	@Override
	public int adminTTInsert(RunningtimeTable runningtimeTable) {

		return sst.insert("runningtimetablens.adminTTInsert", runningtimeTable);
	}

	@Override
	public int adminTTDelete(int rtid) {

		return sst.delete("runningtimetablens.adminTTDelete", rtid);
	}

	@Override
	public int getMaxRtid() {
		return sst.selectOne("runningtimetablens.getMaxRtid");
	}
	
	/* 혜진 */
	public List<RunningtimeTable> showtimesList(int lid, Date date) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("lid", lid);
		hm.put("date", date);
		return sst.selectList("runningtimetablens.showtimesList", hm);
	}

	@Override
	public List<Movie> movieList(int lid, Date date) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("lid", lid);
		hm.put("date", date);
		return sst.selectList("moviens.movieList", hm);
	}

	@Override
	public List<RunningtimeTable> bookedSeatCountList(int lid, Date date) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("lid", lid);
		hm.put("date", date);
		return sst.selectList("runningtimetablens.bookedSeatCountList", hm);
	}
}
