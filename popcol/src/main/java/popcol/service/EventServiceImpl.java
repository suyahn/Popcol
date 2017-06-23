package popcol.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import popcol.dao.EventDao;
import popcol.model.Event;

@Service
public class EventServiceImpl implements EventService {
	@Autowired
	private EventDao ed;

	@Override
	public List<Event> eventList(Event event) {
		return ed.eventList(event);
	}

	@Override
	public int getTotal(Event event) {
		return ed.getTotal(event);
	}

	@Override
	public Event selectEvent(int eid) {
		return ed.selectEvent(eid);
	}

	@Override
	public int insertEvent(Event event) {
		return ed.insertEvent(event);
	}

	@Override
	public int getMaxNum() {
		return ed.getMaxNum();
	}

	
	/* 도은 */
	/* 메인 */
	public List<Event> selectEventListForHome() {
	
		return ed.selectEventListForHome();
	}
}
