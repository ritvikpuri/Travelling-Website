package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class loginController {
	
	@Autowired
	userService serviceU;
	@Autowired
	flightService serviceF;
	/*
	 * @GetMapping(value="/") public String showLoginPage() { return "login"; }
	 */
	
	@GetMapping(value = "/login")
	public String showLoginPage(ModelMap model) {
		
//		  ModelAndView view = new ModelAndView(); 
//		  view.setViewName("login");
		 	
		return "login";
	}
	
	@PostMapping(value="/login")
	public String showWelcomePage(ModelMap model, @RequestParam String username, @RequestParam String password) {
		
		boolean check = serviceU.login(username,password);
		
		if(check) {
			return "book";
		}
		else {
			model.put("errorMessage", "Please check username or password");
			return "login";
			
		}
	}
	
	@GetMapping(value="/new")
	public String newUserPage() {
		return "new";
	}
	
	@PostMapping(value="/new")
	public String enterUserInformation(ModelMap model, @RequestParam String username, @RequestParam String password) {
		
		boolean check = serviceU.addUser(username, password);
		
		if(check) {
			return "login";
		}
		else {
			model.put("errorMessage", "This username is already taken please try a new one");
			return "new";
		}
	}
	
	@GetMapping(value="/book")
	public String viewBookFlights() {
		return "book";
	}
	
	@PostMapping(value="/book")
	public String bookFlights(ModelMap model, @RequestParam String departures, @RequestParam String arrival, @RequestParam int passengers, @RequestParam String travelClass) {
		
		List<flights> flightList =  serviceF.findFlights(departures, arrival, passengers, travelClass);
		model.addAttribute("flightList", flightList);
		
//		for(int i = 0; i < flightList.size(); i++) {
//			model.put(i, flightList.get(i));
//		}
		
		if(flightList.isEmpty()) {
			model.put("errorMessage", "There are no flights availale with the criteria. Please try again.");
			return "viewflights";
		}
		else {
			return "viewflights";
		}
		
	}
	
	@GetMapping(value="/viewFlights")
	public String selectFlights() {
		return "viewFlights";
	}
	
}



























