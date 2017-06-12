package popcol.controller.booking;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import popcol.service.booking.BookingServiceImpl;
@Controller
public class BookingController {
	@Autowired
	private BookingServiceImpl bs;
	

}
