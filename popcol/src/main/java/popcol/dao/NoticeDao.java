package popcol.dao;

import java.util.List;

import popcol.model.Notice;

public interface NoticeDao {
	int getTotal(Notice notice);
	List<Notice> list(Notice notice);
	int insert(Notice notice);
	int getMaxNum();
	Notice select(int nid);
	int update(Notice notice);
	int delete(int nid);
}
