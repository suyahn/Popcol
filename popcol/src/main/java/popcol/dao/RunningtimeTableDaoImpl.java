package popcol.dao;

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
}
