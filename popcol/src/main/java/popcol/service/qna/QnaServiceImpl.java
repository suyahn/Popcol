package popcol.service.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import popcol.dao.qna.QnaDao;
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
}
