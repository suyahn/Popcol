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
}
