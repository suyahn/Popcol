package popcol.dao.faq;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import popcol.model.Faq;

@Repository
public class FaqDaoImpl implements FaqDao {
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public int getTotal(Faq faq) {
		return sst.selectOne("faqns.getTotal", faq);
	}

	@Override
	public List<Faq> list(Faq faq) {
		return sst.selectList("faqns.list", faq);
	}

    @Override
    public int getMaxNum() {
        return sst.selectOne("faqns.getMaxNum");
    }

    @Override
    public int insert(Faq faq) {
        return sst.insert("faqns.insert", faq);
    }

    @Override
    public Faq select(int fid) {
        return sst.selectOne("faqns.select", fid);
    }
}
