package popcol.dao;

import java.util.List;

import popcol.model.Event;

public interface EventDao {
	List<Event> eventList(Event event);
	int getTotal(Event event);
	Event selectEvent(int eid);
	int insertEvent(Event event);
	int getMaxNum();
	
	/* 도은 */
	/* 메인 */
	List<Event> selectEventListForHome();
}
