package popcol.service.notice;

import java.util.List;

import popcol.model.Notice;

public interface NoticeService {
	int getTotal(Notice notice);
	List<Notice> list(Notice notice);
}