package popcol.dao;

import java.util.List;

import popcol.model.Faq;

public interface FaqDao {
	int getTotal(Faq faq);
	List<Faq> list(Faq faq);
    int getMaxNum();
    int insert(Faq faq);
    Faq select(int fid);
	int update(Faq faq);
	int delete(int fid);
}
