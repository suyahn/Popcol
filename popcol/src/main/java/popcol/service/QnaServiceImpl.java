package popcol.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import popcol.dao.QnaDao;
import popcol.model.Qna;

@Service
public class QnaServiceImpl implements QnaService {
	@Autowired
	private QnaDao qd;

	@Override
	public int getTotal() {
		return qd.getTotal();
	}

	@Override
	public List<Qna> list(Qna qna) {
		return qd.list(qna);
	}

	@Override
	public int getMaxNum() {
		return qd.getMaxNum();
	}

	@Override
	public int insert(Qna qna) {
		return qd.insert(qna);
	}

	@Override
	public Qna select(int qid) {
		return qd.select(qid);
	}

	@Override
	public int update(Qna qna) {
		return qd.update(qna);
	}

	@Override
	public int delete(int qid) {
		return qd.delete(qid);
	}

	@Override
	public void insertReply(Qna qna) {
		qd.insertReply(qna);
	}

	@Override
	public void deleteReply(int qid) {
		qd.deleteReply(qid);
	}

	/* 도은 */
	/* 마이페이지 */
	public int mypage_getTotal(String cid) {
		
		return qd.mypage_getTotal(cid);
	}

	public List<Qna> mypage_list(Qna qna) {
		
		return qd.mypage_list(qna);
	}

	public Qna mypage_qnaShow(int qid) {
		
		return qd.mypage_qnaShow(qid);
	}

	public int mypage_qnaDelete(int qid) {
		
		return qd.mypage_qnaDelete(qid);
	}

	public List<Qna> mypage_listMain(String cid) {
		
		return qd.mypage_listMain(cid);
	}
}
