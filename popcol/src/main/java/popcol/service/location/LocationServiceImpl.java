package popcol.service.location;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import popcol.dao.location.LocationDao;
import popcol.model.Location;

@Service
public class LocationServiceImpl implements LocationService{
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
	

}
