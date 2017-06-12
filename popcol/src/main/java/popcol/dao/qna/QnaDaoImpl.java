package popcol.dao.qna;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class QnaDaoImpl {
	@Autowired
	private SqlSessionTemplate sst;
}
