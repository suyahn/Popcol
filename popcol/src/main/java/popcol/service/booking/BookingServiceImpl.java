package popcol.service.booking;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import popcol.dao.booking.BookingDaoImpl;

@Service
public class BookingServiceImpl implements BookingService {
	@Autowired
	private BookingDaoImpl bd;

}
