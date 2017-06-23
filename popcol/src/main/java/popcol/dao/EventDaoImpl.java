package popcol.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import popcol.model.Event;

@Repository
public class EventDaoImpl implements EventDao {
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public List<Event> eventList(Event event) {
		return sst.selectList("eventns.eventList", event);
	}

	@Override
	public int getTotal(Event event) {
		return sst.selectOne("eventns.getTotal", event);
	}

	@Override
	public Event selectEvent(int eid) {
		return sst.selectOne("eventns.selectEvent", eid);
	}

	@Override
	public int insertEvent(Event event) {
		return sst.insert("eventns.insertEvent", event);
	}

	@Override
	public int getMaxNum() {
		return sst.selectOne("eventns.getMaxNum");
	}

	@Override
	public int updateEvent(Event event) {
		return sst.update("eventns.updateEvent", event);
	}

	@Override
	public int deleteEvent(int eid) {
		return sst.update("eventns.deleteEvent", eid);
	}

}
