package popcol.dao.notice;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import popcol.model.Notice;

@Repository
public class NoticeDaoImpl implements NoticeDao {
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public int getTotal(Notice notice) {
		return sst.selectOne("noticens.getTotal", notice);
	}

	@Override
	public List<Notice> list(Notice notice) {
		return sst.selectList("noticens.list", notice);
	}

	@Override
	public int insert(Notice notice) {
		return sst.insert("noticens.insert", notice);
	}

	@Override
	public int getMaxNum() {
		return sst.selectOne("noticens.getMaxNum");
	}
}
