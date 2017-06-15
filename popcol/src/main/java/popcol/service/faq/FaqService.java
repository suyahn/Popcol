package popcol.service.faq;

import java.util.List;

import popcol.model.Faq;

public interface FaqService {
	int getTotal(Faq faq);
	List<Faq> list(Faq faq);
}
