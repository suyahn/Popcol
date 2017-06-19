package popcol.service.qna;

import java.util.List;

import popcol.model.Qna;

public interface QnaService {
	int getTotal();
	List<Qna> list(Qna qna);
}
