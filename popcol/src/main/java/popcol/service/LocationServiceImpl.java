package popcol.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import popcol.dao.LocationDao;
import popcol.model.Location;

@Service
public class LocationServiceImpl implements LocationService {
	@Autowired
	private LocationDao ld;

	@Override
	public List<Location> adminLocationList() {

		return ld.adminLocationList();
	}

	@Override
	public Location adminLocationSelect(int lid) {

		return ld.adminLocationSelect(lid);
	}

	@Override
	public int adminLocationUpdate(Location location) {

		return ld.adminLocationUpdate(location);
	}

	@Override
	public int adminLocationDelete(int lid) {
		
		return ld.adminLocationDelete(lid);
	}

	@Override
	public int adminLocationInsert(Location location) {
		
		return ld.adminLocationInsert(location);
	}

	/* 도은 */
	public List<Location> selectPointLocation() {
		
		return ld.selectPointLocation();
	}

	/*혜진*/
	public List<Location> locationList() {
		return ld.locationList();
	}

	@Override
	public Location selectLocation(int lid) {
		return ld.selectLocation(lid);
	}

}
