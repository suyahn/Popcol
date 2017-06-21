package popcol.controller.price;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import popcol.service.PriceServiceImpl;

@Controller
public class PriceController {
	@Autowired
	private PriceServiceImpl ps;

}
