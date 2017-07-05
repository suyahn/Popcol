package popcol.dao;

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

	@Override
	public Location adminLocationSelect(int lid) {

		return sst.selectOne("locationns.adminLocationSelect", lid);
	}

	@Override
	public int adminLocationUpdate(Location location) {

		return sst.update("locationns.adminLocationUpdate", location);
	}

	@Override
	public int adminLocationDelete(int lid) {

		return sst.delete("locationns.adminLocationDelete", lid);
	}

	@Override
	public int adminLocationInsert(Location location) {
		
		return sst.insert("locationns.adminLocationInsert", location);
	}

	
	public List<Location> selectPointLocation() {
		
		return sst.selectList("locationns.selectPointLocation");
	}

	/*혜진*/
	public List<Location> locationList() {
		return sst.selectList("locationns.locationList");
	}

	@Override
	public Location selectLocation(int lid) {
		return sst.selectOne("locationns.selectLocation", lid);
	}

}
