package popcol.dao.location;

import java.util.List;

import popcol.model.Location;

public interface LocationDao {

	List<Location> adminLocationList();

	Location adminLocationSelect(int lid);

	int adminLocationUpdate(Location location);

	int adminLocationDelete(int lid);

	int adminLocationInsert(Location location);

	

}
