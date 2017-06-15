package popcol.service.faq;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import popcol.dao.faq.FaqDao;
import popcol.model.Faq;

@Service
public class FaqServiceImpl implements FaqService {
	@Autowired
	private FaqDao fd;

	@Override
	public int getTotal(Faq faq) {
		return fd.getTotal(faq);
	}

	@Override
	public List<Faq> list(Faq faq) {
		return fd.list(faq);
	}
    @Override
    public int getMaxNum() {
        return fd.getMaxNum();
    }

    @Override
    public int insert(Faq faq) {
        return fd.insert(faq);
    }

    @Override
    public Faq select(int fid) {
        return fd.select(fid);
    }

	@Override
	public int update(Faq faq) {
		return fd.update(faq);
	}

	@Override
	public int delete(int fid) {
		return fd.delete(fid);
	}
}
