package popcol.dao.event;

import java.util.List;

import popcol.model.Event;

public interface EventDao {
	List<Event> eventList(Event event);
	int getTotal(Event event);
	Event selectEvent(int eid);
}
