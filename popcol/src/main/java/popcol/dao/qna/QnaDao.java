package popcol.dao.qna;

import java.util.List;

import popcol.model.Qna;

public interface QnaDao {
	int getTotal();
	List<Qna> list(Qna qna);
}
