package popcol.dao.qna;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import popcol.model.Qna;

@Repository
public class QnaDaoImpl implements QnaDao {
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public int getTotal() {
		return sst.selectOne("qnans.getTotal");
	}

	@Override
	public List<Qna> list(Qna qna) {
		return sst.selectList("qnans.list", qna);
	}

	@Override
	public int getMaxNum() {
		return sst.selectOne("qnans.getMaxNum");
	}

	@Override
	public int insert(Qna qna) {
		return sst.insert("qnans.insert", qna);
	}

	@Override
	public Qna select(int qid) {
		return sst.selectOne("qnans.select", qid);
	}

	@Override
	public int update(Qna qna) {
		return sst.update("qnans.update", qna);
	}

	@Override
	public int delete(int qid) {
		return sst.update("qnans.delete", qid);
	}
}
