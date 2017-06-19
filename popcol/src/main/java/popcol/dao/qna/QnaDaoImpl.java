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
}
