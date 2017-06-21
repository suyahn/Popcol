package popcol.service;

import java.util.List;

import popcol.model.Qna;

public interface QnaService {
	int getTotal();
	List<Qna> list(Qna qna);
	int getMaxNum();
	int insert(Qna qna);
	Qna select(int qid);
	int update(Qna qna);
	int delete(int qid);
	void insertReply(Qna qna);
	void deleteReply(int qid);
	
	int mypage_getTotal(String cid);
	
	List<Qna> mypage_list(Qna qna);
	
	Qna mypage_qnaShow(int qid);
	
	int mypage_qnaDelete(int qid);
}
