package popcol.service;

import java.util.List;

import popcol.model.Event;

public interface EventService {
	List<Event> eventList(Event event);
	int getTotal(Event event);
	Event selectEvent(int eid);
	int insertEvent(Event event);
	int getMaxNum();
	int updateEvent(Event event);
	int deleteEvent(int eid);
	
	/* 도은 */
	/* 메인 */
	List<Event> selectEventListForHome();
	
}
