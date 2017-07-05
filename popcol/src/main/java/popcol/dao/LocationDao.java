package popcol.dao;

import java.util.List;

import popcol.model.Location;

public interface LocationDao {

	List<Location> adminLocationList();

	Location adminLocationSelect(int lid);

	int adminLocationUpdate(Location location);

	int adminLocationDelete(int lid);

	int adminLocationInsert(Location location);

	/* 도은 */
	List<Location> selectPointLocation();
	/*혜진*/
	List<Location> locationList();

	Location selectLocation(int lid);

	

}
