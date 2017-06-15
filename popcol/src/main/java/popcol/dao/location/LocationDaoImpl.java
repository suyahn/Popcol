package popcol.dao.location;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import popcol.model.Location;

@Repository
public class LocationDaoImpl implements LocationDao {
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public List<Location> adminLocationList() {
	
		return sst.selectList("locationns.adminLocationList");
	}
}
