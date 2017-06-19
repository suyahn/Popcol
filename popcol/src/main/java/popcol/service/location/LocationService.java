package popcol.service.location;

import java.util.List;

import popcol.model.Location;

public interface LocationService {

	List<Location> adminLocationList();

	Location adminLocationSelect(int lid);

	

}
