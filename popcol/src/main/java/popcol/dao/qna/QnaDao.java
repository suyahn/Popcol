package popcol.dao.qna;

import java.util.List;

import popcol.model.Qna;

public interface QnaDao {
	int getTotal();
	List<Qna> list(Qna qna);
	int getMaxNum();
	int insert(Qna qna);
	Qna select(int qid);
	int update(Qna qna);
	int delete(int qid);
}
