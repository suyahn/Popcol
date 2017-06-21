package popcol.dao.event;

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

}
