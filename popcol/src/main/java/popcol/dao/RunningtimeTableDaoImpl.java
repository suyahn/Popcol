package popcol.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	public int getTotal1() {

		return sst.selectOne("runningtimetablens.getTotal1");
	}

	@Override
	public int getTotal2(RunningtimeTable runningtimeTable) {

		return sst.selectOne("runningtimetablens.getTotal2", runningtimeTable);
	}

	/*혜진*/
	public List<RunningtimeTable> showtimesList(int lid, Date date) {
		HashMap<String,Object> hm = new HashMap<String, Object>();
		hm.put("lid", lid); hm.put("date", date);
		return sst.selectList("runningtimetablens.showtimesList",hm);
	}
}
