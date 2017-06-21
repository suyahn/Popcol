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

	@Override
	public void insertReply(Qna qna) {
		sst.update("qnans.insertReply", qna);
	}

	@Override
	public void deleteReply(int qid) {
		sst.update("qnans.deleteReply", qid);
	}

	public int mypage_getTotal(String cid) {
		
		return sst.selectOne("qnans.mypage_getTotal", cid);
	}

	public List<Qna> mypage_list(Qna qna) {
		
		return sst.selectList("qnans.mypage_list", qna);
	}

	public Qna mypage_qnaShow(int qid) {
		
		return sst.selectOne("qnans.mypage_qnaShow", qid);
	}

	public int mypage_qnaDelete(int qid) {
		
		return sst.update("qnans.mypage_qnaDelete", qid);
	}
}
