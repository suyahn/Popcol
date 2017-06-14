package popcol.service.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import popcol.dao.notice.NoticeDao;
import popcol.model.Notice;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private NoticeDao nd;

	@Override
	public int getTotal(Notice notice) {
		return nd.getTotal(notice);
	}

	@Override
	public List<Notice> list(Notice notice) {
		return nd.list(notice);
	}

	@Override
	public int insert(Notice notice) {
		return nd.insert(notice);
	}

	@Override
	public int getMaxNum() {
		return nd.getMaxNum();
	}

	@Override
	public Notice select(int nid) {
		return nd.select(nid);
	}

}
