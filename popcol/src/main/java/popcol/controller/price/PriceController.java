package popcol.controller.price;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import popcol.service.price.PriceServiceImpl;

@Controller
public class PriceController {
	@Autowired
	private PriceServiceImpl ps;

}